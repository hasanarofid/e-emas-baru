<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HakaksesM extends Model
{
    use HasFactory;
    protected $table = 'hakakses_m';
    protected $fillable = [
        'user_id',
        'role_id',
        'menu_id',
    ];
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public function role()
    {
        return $this->belongsTo(Role::class,'role_id');
    }

    public function menuSystem()
    {
        return $this->belongsTo(MenuM::class,'menu_id');
    }
}
