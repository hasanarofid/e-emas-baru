<?php

namespace App\Models\emas;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KonfigsystemK extends Model
{
    use HasFactory;
    protected $table = 'konfigsystem_k';
    protected $fillable = [
        'nama_perusahan',
        'alamat',
        'email',
        'no_telp',
        "diskon",
        "pajak",
    ];
}
