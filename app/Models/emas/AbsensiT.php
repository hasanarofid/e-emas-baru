<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AbsensiT extends Model
{
    use HasFactory;
    protected $table = 'absensi_t';

    public function toko()
    {
        return $this->belongsTo(Location::class, 'id_toko', 'id');
    }

    public function pegawai()
    {
        return $this->belongsTo(Employees::class, 'employee_id', 'id');
    }
    public function petugas()
    {
        return $this->belongsTo(User::class, 'id_create_pegawai', 'id');
    }
    
}
