<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Karat extends Model
{
    use HasFactory;
    protected $table = 'karat';
    protected $guarded = [
        'id',
    ];

    protected $fillable = [
        'name',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function scopeSearch($query, $value): void
    {
        $query->where('name', 'like', "%{$value}%");
    }
}
