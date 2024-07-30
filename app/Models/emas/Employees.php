<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employees extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'address',
        'no_identitas',
        'tgl_lahir',
        'jabatan',
        'hire_date',
        'id_toko',
        // '_token', // Tambahkan _token ke dalam fillable untuk memperbolehkannya disimpan melalui mass assignment
    ];

    public function toko()
    {
        return $this->belongsTo(Location::class, 'id_toko', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    

    public function scopeSearch($query, $value): void
    {
        $query->where('name', 'like', "%{$value}%")
            ->orWhere('email', 'like', "%{$value}%")
            ->orWhereHas('toko', function ($query) use ($value) {
                $query->where('name', 'like', "%{$value}%");
            });
    }

    public function getRouteKeyName(): string
    {
        return 'name';
    }
    

}
