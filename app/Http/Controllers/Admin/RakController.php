<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\emas\Rack;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;


class RakController extends Controller
{
 /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $auth = Auth::user();
        $model = Rack::with('toko')
        ->whereHas('toko', function ($query) use ($auth) {
            $query->where('id', $auth->id_toko);
        })
        ->orderBy('created_at', 'DESC')
        ->orderBy('updated_at', 'DESC')
        ->get();
        return view('admin.rak.index',compact('model'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.rak.create');
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
            'code'=>'required'
        ]);

        Rack::create([
            'name' => $request->name,
            'code' => $request->code,
            'id_toko'=>Auth::user()->id_toko
        ]);

        Alert::success('success', ' Berhasil Input Data !');
        return redirect('rak');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        
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
        $model = Rack::find($data);
        return view('admin.rak.edit', [
            'id' => $id,
            'model' => $model
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
            'code'=>'required'
        ]);

        $model = Rack::find($id);
        $model->name = $request->name;
        $model->code = $request->code;
        $model->save();
        Alert::success('success', ' Berhasil Update Data !');
        return redirect(route('rak.index'));
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
        
        $model = Rack::find($data);
        $model->delete();

        Alert::success('success', ' Berhasil Hapus Data !');
        return redirect('rak');
    }
}
