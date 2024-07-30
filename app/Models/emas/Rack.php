<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rack extends Model
{
    use HasFactory;
    protected $table='rack';
    protected $fillable = [
        'code',
        'name',
        'id_toko'
    ];

    public function toko()
    {
        return $this->belongsTo(Location::class, 'id_toko', 'id');
    }

    public function scopeSearch($query, $value): void
    {
        $query->where('code', 'like', "%{$value}%")
         ->orWhere('name', 'like', "%{$value}%");
    }
    const CODE_PREFIX = 'R';

    // Mendefinisikan panjang digit untuk nomor urut
    const CODE_DIGITS = 3;

    public static function generateCode()
    {
        // Mengambil rak terakhir yang memiliki kode
        $lastRack = self::whereNotNull('code')->orderByDesc('id')->first();

        // Jika tidak ada rak sebelumnya, mulai dengan nomor 1
        $lastNumber = $lastRack ? (int) substr($lastRack->code, strlen(self::CODE_PREFIX)) : 0;

        // Membuat kode berikutnya
        $nextNumber = $lastNumber + 1;
        $code = self::CODE_PREFIX . str_pad($nextNumber, self::CODE_DIGITS, '0', STR_PAD_LEFT);

        return $code;
    }


}
