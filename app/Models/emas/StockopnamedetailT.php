<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockopnamedetailT extends Model
{
    use HasFactory;
    protected $table = 'stockopnamedetail_t';

    protected $guarded = [
        'id',
    ];

    protected $fillable = [
        'id_product',
        'id_stockopname',
        'stock_system',
        'stock_real',
        'keadaan',
        'keterangan',
    ];


}
