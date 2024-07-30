<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MenuM extends Model
{
    use HasFactory;
    protected $table = 'menu_m';

    public function children()
    {
        return $this->hasMany(MenuM::class, 'parent');
    }

    public function parentmenu()
    {
        return $this->belongsTo(MenuM::class, 'parent');
    }

    public function hakAkses()
    {
        return $this->hasMany(HakaksesM::class);
    }
}
