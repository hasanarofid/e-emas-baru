<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\emas\Type;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;


class TipeController extends Controller
{
            /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $model = Type::orderBy('created_at', 'DESC')
        ->orderBy('updated_at', 'DESC')
        ->get();
        return view('admin.tipe.index',compact('model'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.tipe.create');
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
        ]);

        Type::create([
            'name' => $request->name
        ]);

        Alert::success('success', ' Berhasil Input Data !');
        return redirect('tipe');

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
        $model = Type::find($data);
        return view('admin.tipe.edit', [
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
        ]);

        $model = Type::find($id);
        $model->name = $request->name;
        $model->save();
        Alert::success('success', ' Berhasil Update Data !');
        return redirect(route('tipe.index'));
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
        
        $model = Type::find($data);
        $model->delete();

        Alert::success('success', ' Berhasil Hapus Data !');
        return redirect('tipe');
    }
}
