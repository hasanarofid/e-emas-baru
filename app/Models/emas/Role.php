<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;
    protected $table = 'role';
    protected $fillable = [
        'name',
    ];

    public function scopeSearch($query, $value): void
    {
        $query->where('name', 'like', "%{$value}%");
    }

    public function roles()
    {
        return $this->belongsTo(Role::class,'id', 'role_id');
    }

    public function getRouteKeyName(): string
    {
        return 'name';
    }

    
}
