<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\emas\Category;
use App\Models\emas\Karat;
use App\Models\emas\OrderDetails;
use App\Models\emas\Product;
use App\Models\emas\Rack;
use App\Models\emas\Type;
use App\Models\emas\Unit;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\SUpport\Str;
use Haruncpi\LaravelIdGenerator\IdGenerator;

class ProdukController extends Controller
{
           /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $auth = Auth::user();
        $model = Product:: with(['category', 'unit','toko','karat','tipe','rak'])
        ->with('toko')
        ->whereHas('toko', function ($query) use ($auth) {
            $query->where('id', $auth->id_toko);
        })
        ->orderBy('created_at', 'DESC')
        ->orderBy('updated_at', 'DESC')
        ->get();
        return view('admin.produk.index',compact('model'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $auth = Auth::user();
        $categories = Category::get(['id', 'name']);
        $units = Unit::get(['id', 'name']);
        $karat = Karat::get(['id', 'name']);
        $tipe = Type::get(['id', 'name']);
        $rak = Rack::where('id_toko',$auth->id_toko)->get(['id', 'name']);
        return view('admin.produk.create',[
            'categories' => $categories,
            'units' => $units,
            'karat' => $karat,
            'tipe' => $tipe,
            'rak' => $rak,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $this->validate($request, [
            'name' => 'required',
            'quantity' => 'required',
            'buying_price' => 'required',
            'selling_price' => 'required',
            'id_tipe' => 'required',
            'product_image' => 'required|file:jpeg,png,jpg|max:5000',

        ]);
      // Get the file extension
        // $extension = $request->file('product_image')->extension();

        // Create a unique file name
        // $docname = $request->txtBarang . '_' . date('dmyHi') . '.' . $extension;
        // $path = $request->file('product_image')->store('images/produk', 'public');
  
        // $path = Storage::putFileAs('public/images/produk/', $request->file('product_image'), $docname);
        if ($request->hasFile('product_image')) {
            $file = $request->file('product_image');
            $image = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $directory = 'images/products';
            
            // Pastikan folder ada, jika tidak buat folder baru
            if (!file_exists(public_path($directory))) {
                mkdir(public_path($directory), 0777, true);
                // Ubah izin akses folder
                chmod(public_path($directory), 0777);
            }
        
            // Pastikan file diunggah dengan benar
            if ($file->isValid()) {
                // Pindahkan file ke direktori yang ditentukan
                if (move_uploaded_file($file->getPathname(), public_path($directory . '/' . $image))) {
                    // File berhasil diunggah
                } else {
                    // Jika gagal menyimpan file
                    dd("Gagal menyimpan file.");
                }
            } 
        }
        
        $code = IdGenerator::generate([
            'table' => 'products',
            'field' => 'code',
            'length' => 10,
            'prefix' => 'PROD-'
        ]);
        $buying_price2 = $request->buying_price;
        $buying_price_string = preg_replace("/[^0-9]/", "", $buying_price2);
        $buying_price = (int) $buying_price_string;

        $selling_price2 = $request->selling_price;
        $selling_price_string = preg_replace("/[^0-9]/", "", $selling_price2);
        $selling_price = (int) $selling_price_string;
        // dd($selling_price);
        Product::create([
            'name' => $request->name,
            // 'product_image' => $docname,
            'product_image'=>$image,
            "slug" => Str::slug($request->name, '-'),
            "uuid" => Str::uuid(),
            'user_id'=>Auth::user()->id,
            'code'=>$code,
            'quantity'=>$request->quantity,
            'buying_price'=>$buying_price,
            'selling_price'=>$selling_price,
            'quantity_alert'=>1,
            'tax'=>0,
            'tax_type'=>0,
            'notes'=>$request->notes,
            'category_id'=>$request->category_id,
            'unit_id'=>$request->unit_id,
            'id_toko'=>Auth::user()->id_toko,
            'id_karat'=>$request->id_karat,
            'id_rak'=>$request->id_rak,
            'id_tipe'=>$request->id_tipe,
        ]);

        Alert::success('success', ' Berhasil Input Data !');
        return redirect('produk');

    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = Crypt::decryptString($id);
        // dd($data);
        $model = Product::find($data);
         $auth = Auth::user();
        $categories = Category::get(['id', 'name']);
        $units = Unit::get(['id', 'name']);
        $karat = Karat::get(['id', 'name']);
        $tipe = Type::get(['id', 'name']);
        $rak = Rack::where('id_toko',$auth->id_toko)->get(['id', 'name']);
        return view('admin.produk.edit', [
            'id' => $id,
            'model' => $model,
            'categories' => $categories,
            'units' => $units,
            'karat' => $karat,
            'tipe' => $tipe,
            'rak' => $rak,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $id = Crypt::decryptString($id);

        $this->validate($request, [
            'name' => 'required',
            'quantity' => 'required',
            'buying_price' => 'required',
            'selling_price' => 'required',
            'id_tipe' => 'required',
            'product_image' => 'required|file:jpeg,png,jpg|max:5000',
        ]);
        $model = Product::find($id);
        if ($request->hasFile('product_image')) {
            $file = $request->file('product_image');
            $image = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $directory = 'images/products';
            
            // Pastikan folder ada, jika tidak buat folder baru
            if (!file_exists(public_path($directory))) {
                mkdir(public_path($directory), 0777, true);
                // Ubah izin akses folder
                chmod(public_path($directory), 0777);
            }
        
            // Pastikan file diunggah dengan benar
            if ($file->isValid()) {
                // Pindahkan file ke direktori yang ditentukan
                if (move_uploaded_file($file->getPathname(), public_path($directory . '/' . $image))) {
                    // File berhasil diunggah
                } else {
                    // Jika gagal menyimpan file
                    dd("Gagal menyimpan file.");
                }
            } 
            $model->product_image = $image;
        }

        $buying_price2 = $request->buying_price;
        $buying_price_string = preg_replace("/[^0-9]/", "", $buying_price2);
        $buying_price = (int) $buying_price_string;

        $selling_price2 = $request->selling_price;
        $selling_price_string = preg_replace("/[^0-9]/", "", $selling_price2);
        $selling_price = (int) $selling_price_string;

        $model->name = $request->name;
        $model->quantity = $request->quantity;
        $model->buying_price = $buying_price;
        $model->selling_price = $selling_price;
        $model->notes = $request->notes;
        $model->category_id = $request->category_id;
        $model->unit_id = $request->unit_id;
        $model->id_karat = $request->id_karat;
        $model->id_rak = $request->id_rak;
        $model->id_tipe = $request->id_tipe;
        $model->save();
        Alert::success('success', ' Berhasil Update Data !');
        return redirect(route('produk.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Crypt::decryptString($id);
        
        $model = Product::find($data);

        $isUsed = OrderDetails::where('product_id', $data)->exists();
        // dd($isUsed);
        if ($isUsed) {
            Alert::success('error', ' Data tidak bisa dihapus karena masih digunakan di tabel lain. !');
         return redirect('produk');
           
        }


        $model->delete();

        Alert::success('success', ' Berhasil Hapus Data !');
        return redirect('produk');
    }
}
