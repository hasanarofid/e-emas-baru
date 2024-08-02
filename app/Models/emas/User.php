<?php

namespace App\Models\emas;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'uuid',
        'photo',
        'name',
        'username',
        'email',
        'password',
        "store_name",
        "store_address",
        "store_phone",
        "store_email",
        "role_id",
        "id_toko",
        "remember_token",
        "email_verified_at",
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime'
    ];

    public function hakAkses()
    {
        return $this->hasMany(HakaksesM::class, 'user_id');
    }
    public function roles()
    {
        return $this->belongsTo(Role::class, 'role_id');
    }

    public function toko()
    {
        return $this->belongsTo(Location::class, 'id_toko', 'id');
    }

    public function scopeSearch($query, $value): void
    {
        $query->where('name', 'like', "%{$value}%")
            ->orWhere('email', 'like', "%{$value}%")
            ->orWhereHas('roles', function ($query) use ($value) {
                $query->where('name', 'like', "%{$value}%");
            })
            ->orWhereHas('toko', function ($query) use ($value) {
                $query->where('name', 'like', "%{$value}%");
            });
    }

    public function getRouteKeyName(): string
    {
        return 'name';
    }

    
}
