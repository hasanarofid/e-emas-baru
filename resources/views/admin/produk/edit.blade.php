@extends('layout.base')

@section('title', 'Data Produk')


@section('content_header')
    <div class="page-header page-header-default">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-cash3"></i> <span class="text-semibold">Data Master Toko/Cabang</span>
                    - Edit Data Produk</h4>
            </div>

        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><a href="{{ route('produk.index') }}"><i class="active icon-home2 position-left"></i> List
                        Data
                        Produk</a>
                </li>

                <li class="active">Edit Data Produk</li>
                {{-- <li class="active">Dashboard</li> --}}
            </ul>
        </div>
    </div>
@endsection

@section('content')

    <div class="panel bg-info">
        <div class="panel-heading">
            <em>
                <h6> Halaman ini berguna apabila anda ingin menambah Produk  baru</h6>
            </em>
            <div class="heading-elements">
                <ul class="icons-list">
                    <li><a data-action="close"></a></li>
                </ul>
            </div>

        </div>
    </div>

    <form method="post" enctype="multipart/form-data" action="{{ route('produk.update', $id) }}">

        {{ csrf_field() }}
        {{ method_field('PUT') }}

        <div class="panel panel-flat">
            <div class="panel-body">
                <div class="row">
                    <div class="col">
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">
                                    {{ __('Product Image') }}
                                </h3>
                                @php 
                                $path = asset('images/products/' . $model->product_image);
                                @endphp
                                <img src="{{ $path }}" id="image-preview"
                                    onerror="this.onerror=null; this.src='{{ URL::to('/admin/assets/images/brands/emas.png') }}'"
                                    alt="product_image" width="160">
                             
                                <div class="small font-italic text-muted mb-2">
                                    JPG or PNG no larger than 2 MB
                                </div>

                                <input
                                    type="file"
                                    accept="image/*"
                                    id="image"
                                    name="product_image"
                                    class="form-control @error('product_image') is-invalid @enderror"
                                    onchange="previewImage();"
                                >

                                @error('product_image')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Nama</label>
                                            <input type="text" name="name" class="form-control" placeholder="Nama Produk . . . "
                                                value="{{ $model->name }}">

                                            @if ($errors->has('name'))
                                                <div class="text-danger">
                                                    {{ $errors->first('name') }}
                                                </div>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Kategori</label>
                                            <select name="category_id" id="category_id"
                                            class="form-control @error('category_id') is-invalid @enderror">
                                            <option value=""  disabled="">
                                                .: Pilih :.
                                                </option>

                                                @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}" 
                                                        {{ $model->category_id == $category->id ? 'selected' : '' }}>
                                                        {{ $category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                    
                                            @if ($errors->has('category_id'))
                                                <div class="text-danger">
                                                    {{ $errors->first('category_id') }}
                                                </div>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Pilih Satuan</label>
                                            <select name="unit_id" id="unit_id"
                                            class="form-control @error('unit_id') is-invalid @enderror">
                                            <option value=""  disabled="">
                                                    .: Pilih :.
                                                </option>

                                                @foreach ($units as $unit)
                                                    <option value="{{ $unit->id }}" 
                                                        {{ $model->unit_id == $unit->id ? 'selected' : '' }}>{{ $unit->name }}</option>
                                                @endforeach
                                            </select>

                                            @if ($errors->has('unit_id'))
                                                <div class="text-danger">
                                                    {{ $errors->first('unit_id') }}
                                                </div>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Pilih Karat</label>
                                            <select name="id_karat" id="id_karat"
                                            class="form-control @error('id_karat') is-invalid @enderror">
                                            <option value=""  disabled="">
                                                    .: Pilih :.
                                                </option>

                                                @foreach ($karat as $val)
                                                    <option value="{{ $val->id }}" 
                                                        @if($model->id_karat == $val->id) selected="selected" @endif>
                                                        {{ $val->name }}
                                                    </option>
                                                @endforeach
                                            </select>


                                            @if ($errors->has('id_karat'))
                                                <div class="text-danger">
                                                    {{ $errors->first('id_karat') }}
                                                </div>
                                            @endif
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Pilih Tipe</label>
                                            <select name="id_tipe" id="id_tipe"
                                            class="form-control @error('id_tipe') is-invalid @enderror">
                                            <option value=""  disabled="">
                                                    .: Pilih :.
                                                </option>

                                                @foreach ($tipe as $tip)
                                                    <option value="{{ $tip->id }}" @if($model->id_tipe == $tip->id) selected="selected" @endif>{{ $tip->name }}</option>
                                                @endforeach
                                            </select>


                                            @if ($errors->has('id_tipe'))
                                                <div class="text-danger">
                                                    {{ $errors->first('id_tipe') }}
                                                </div>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Pilih Rak</label>
                                            <select name="id_rak" id="id_rak"
                                            class="form-control @error('id_rak') is-invalid @enderror">
                                            <option value=""  disabled="">
                                                    .: Pilih :.
                                                </option>

                                                @foreach ($rak as $value)
                                                    <option value="{{ $value->id }}" @if($model->id_rak == $value->id) selected="selected" @endif>{{ $value->name }}</option>
                                                @endforeach
                                            </select>


                                            @if ($errors->has('id_rak'))
                                                <div class="text-danger">
                                                    {{ $errors->first('id_rak') }}
                                                </div>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Harga Beli</label>
                                            <input class="form-control" value="{{ 'Rp. ' . number_format($model->buying_price, 0, ',', '.') }}" type="text" name="buying_price" id="buying_price" required="required">                                       
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Harga Jual</label>
                                            <input class="form-control" value="{{ 'Rp. ' . number_format($model->selling_price, 0, ',', '.') }}" type="text" name="selling_price" id="selling_price" required="required">                                       

                                       
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Quantity / Jumlah</label>
                                            <input type="text"
                                            label="Quantity"
                                            name="quantity"
                                            id="quantity"
                                            class="form-control"
                                            
                                            value="{{ $model->quantity }}" >
                                       
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="notes" class="form-label">
                                                {{ __('Notes') }}
                                            </label>

                                            <textarea name="notes"
                                                      id="notes"
                                                      rows="5"
                                                      class="form-control @error('notes') is-invalid @enderror"
                                                      
                                            >
                                        {{ $model->notes }} </textarea>

                                            @error('notes')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                            @enderror
                                        </div>
                                    </div>
                                    
                                    
                            </div>
                        </div>
                    </div>

                    
              



                </div>

                <div class="text-right mt-3">
                    <button type="submit" class="btn btn-primary">Submit form <i
                            class="icon-arrow-right14 position-right"></i></button>
                </div>
            </div>
        </div>
    </form>
    <!-- /2 columns form -->

@endsection

@section('custom_script')

   
<script>

// Event listener for selling price input field
$('#selling_price').on('keyup', function(e) {
        $(this).val(formatRupiah(this.value, "Rp. "));
    });

    // Event listener for buying price input field
    $('#buying_price').on('keyup', function(e) {
        $(this).val(formatRupiah(this.value, "Rp. "));
    });

    // Function to format numbers into Rupiah currency format
    
    // jQuery to ensure quantity input only accepts numbers
    $('#quantity').on('input', function() {
        // Remove any non-numeric characters
        this.value = this.value.replace(/\D/g, '');
    });

    $('#quantity').on('keydown', function(e) {
        // Allow: backspace, delete, tab, escape, enter
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13]) !== -1 ||
            // Allow: Ctrl/cmd+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
            // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });


$("#image").change(function() {
        previewImage(this);
    });
function formatRupiah(angka, prefix) {
        var number_string = angka.replace(/[^,\d]/g, '').toString(),
            split = number_string.split(','),
            sisa = split[0].length % 3,
            rupiah = split[0].substr(0, sisa),
            ribuan = split[0].substr(sisa).match(/\d{3}/gi);

        if (ribuan) {
            var separator = sisa ? '.' : '';
            rupiah += separator + ribuan.join('.');
        }

        rupiah = split[1] !== undefined ? rupiah + ',' + split[1] : rupiah;
        return prefix === undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
    }


    function previewImage(input) {
        const imagePreview = document.querySelector("#image-preview");

        const oFReader = new FileReader();
        oFReader.readAsDataURL(input.files[0]);

        oFReader.onload = function(oFREvent) {
            imagePreview.src = oFREvent.target.result;
        };
    }

</script>


@endsection
