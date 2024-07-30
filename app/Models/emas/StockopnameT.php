<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockopnameT extends Model
{
    use HasFactory;
    protected $table = 'stockopname_t';
    protected $guarded = [
        'id',
    ];

    protected $fillable = [
        'id_toko',
        'id_create_pegawai',
        'purchase_no',
        'date',
        'stockopname_no',
    ];


}
