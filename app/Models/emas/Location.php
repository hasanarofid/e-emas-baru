<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;
    protected $guarded = [
        'id',
    ];

    protected $fillable = [
        'name',
        'address',
        'city',
        'province',
        "country",
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];
    public function scopeSearch($query, $value): void
    {
        $query->where('name', 'like', "%{$value}%")
            ->orWhere('address', 'like', "%{$value}%")
            ->orWhere('country', 'like', "%{$value}%")
            ->orWhere('city', 'like', "%{$value}%");
    }

    public function getRouteKeyName(): string
    {
        return 'name';
    }

}
