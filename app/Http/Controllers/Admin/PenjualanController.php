<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\emas\Category;
use App\Models\emas\Customer;
use App\Models\emas\KonfigsystemK;
use App\Models\emas\Product;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Http\Request;

class PenjualanController extends Controller
{
    public function index()
    {
        $products = Product::with('karat','tipe')->where('id_toko', auth()->user()->id_toko)->with(['category', 'unit'])->get();

        $customers = Customer::where('user_id', auth()->id())->get(['id', 'name']);

        $categories = Category::get();
        $konfig = KonfigsystemK::first();

        $invoice_no =  IdGenerator::generate([
            'table' => 'orders',
            'field' => 'invoice_no',
            'length' => 10,
            'prefix' => 'INV-'
        ]);

        return view('admin.penjualan.create', [
            'products' => $products,
            'customers' => $customers,
            'categories' => $categories,
            'konfig' => $konfig,
            'invoice_no'=>$invoice_no
        ]);
    }
    
    public function create_order(Request $request){
        dd($request);
    }

}
