<?php

namespace App\Models\emas;

use App\Enums\TaxType;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public $fillable = [
        'name',
        'slug',
        'code',
        'quantity',
        'quantity_alert',
        'buying_price',
        'selling_price',
        'tax',
        'tax_type',
        'notes',
        'product_image',
        'category_id',
        'unit_id',
        'created_at',
        'updated_at',
        "user_id",
        "uuid",
        'id_karat',
        'id_toko',
        'id_tipe',
        'id_rak',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function getRouteKeyName(): string
    {
        return 'slug';
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function karat(): BelongsTo
    {
        return $this->belongsTo(Karat::class, 'id_karat', 'id');
    }

    public function tipe(): BelongsTo
    {
        return $this->belongsTo(Type::class, 'id_tipe', 'id');
    }

    public function rak(): BelongsTo
    {
        return $this->belongsTo(Rack::class, 'id_rak', 'id');
    }

    public function unit(): BelongsTo
    {
        return $this->belongsTo(Unit::class);
    }

    public function toko()
    {
        return $this->belongsTo(Location::class, 'id_toko', 'id');
    }



    public function scopeSearch($query, $value): void
    {
        $query->where('name', 'like', "%{$value}%")
            ->orWhere('code', 'like', "%{$value}%");
    }
     /**
     * Get the user that owns the Category
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo('App\Models\Pegawai', 'id_user', 'id');
    }
}
