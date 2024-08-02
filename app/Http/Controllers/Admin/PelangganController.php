<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\emas\Customer;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\SUpport\Str;
use Haruncpi\LaravelIdGenerator\IdGenerator;
class PelangganController extends Controller
{
          /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $auth = Auth::user();
        $model = Customer::orderBy('created_at', 'DESC')
        ->orderBy('updated_at', 'DESC')
        ->get();
        return view('admin.pelanggan.index',compact('model'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.pelanggan.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required:email',
            'phone' => 'required',
            'address' => 'required',
            'account_holder' => 'required',
            'account_number' => 'required',
            'bank_name' => 'required',
            'photo' => 'required|file:jpeg,png,jpg|max:5000',

        ]);
       if ($request->hasFile('photo')) {
            $file = $request->file('photo');
            $image = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $directory = 'images/pelanggan';
            
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
       
        Customer::create([
            'name' => $request->name,
            'photo'=>$image,
            "uuid" => Str::uuid(),
            'user_id'=>Auth::user()->id,
            'email'=>$request->email,
            'phone'=>$request->phone,
            'address'=>$request->address,
            'account_holder'=>$request->account_holder,
            'account_number'=>$request->account_number,
            'bank_name'=>$request->bank_name,
        ]);

        Alert::success('success', ' Berhasil Input Data !');
        return redirect('pelanggan');

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
        $model = Customer::find($data);
        return view('admin.pelanggan.edit', [
            'id' => $id,
            'model' => $model,
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
        // dd($request->all());
        $id = Crypt::decryptString($id);

        $this->validate($request, [
            'name' => 'required',
            'email' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'account_holder' => 'required',
            'account_number' => 'required',
            'bank_name' => 'required',
            'photo' => 'required|file:jpeg,png,jpg|max:5000',
        ]);
        $model = Customer::find($id);
        if ($request->hasFile('photo')) {
            $file = $request->file('photo');
            $image = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $directory = 'images/pelanggan';
            
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
            $model->photo = $image;
        }

       

        $model->name = $request->name;
        $model->email = $request->email;
        $model->phone = $request->phone;
        $model->address = $request->address;
        $model->account_holder = $request->account_holder;
        $model->account_number = $request->account_number;
        $model->bank_name = $request->bank_name;
        $model->save();
        Alert::success('success', ' Berhasil Update Data !');
        return redirect(route('pelanggan.index'));
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
        
        $model = Customer::find($data);

      
        $model->delete();

        Alert::success('success', ' Berhasil Hapus Data !');
        return redirect('pelanggan');
    }
}
