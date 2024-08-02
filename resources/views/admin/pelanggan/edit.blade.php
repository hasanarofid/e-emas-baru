@extends('layout.base')

@section('title', 'Data Pelanggan')


@section('content_header')
    <div class="page-header page-header-default">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-cash3"></i> <span class="text-semibold">Data Master Toko/Cabang</span>
                    - Edit Data Pelanggan</h4>
            </div>

        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><a href="{{ route('pelanggan.index') }}"><i class="active icon-home2 position-left"></i> List
                        Data
                        Pelanggan</a>
                </li>

                <li class="active">Edit Data Pelanggan</li>
                {{-- <li class="active">Dashboard</li> --}}
            </ul>
        </div>
    </div>
@endsection

@section('content')

    <div class="panel bg-info">
        <div class="panel-heading">
            <em>
                <h6> Halaman ini berguna apabila anda ingin menambah Pelanggan  baru</h6>
            </em>
            <div class="heading-elements">
                <ul class="icons-list">
                    <li><a data-action="close"></a></li>
                </ul>
            </div>

        </div>
    </div>

    <form method="post" enctype="multipart/form-data" action="{{ route('pelanggan.update', $id) }}">

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
                                $path = asset('images/pelanggan/' . $model->photo);
                                @endphp
                              <img src="{{ $path }}" id="image-preview"
                              onerror="this.onerror=null; this.src='{{ URL::to('/admin/assets/images/brands/user.jpg') }}'"
                              alt="product_image" width="160">
                                <div class="small font-italic text-muted mb-2">
                                    JPG or PNG no larger than 2 MB
                                </div>

                                <input
                                    type="file"
                                    accept="image/*"
                                    id="image"
                                    name="photo"
                                    class="form-control @error('photo') is-invalid @enderror"
                                    onchange="previewImage();"
                                >

                                @error('photo')
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
                                            <input type="text" name="name" class="form-control" placeholder="Nama Pelanggan . . . "
                                                value="{{ $model->name }}">

                                                @error('name')
                                                <div class="text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Email</label>
                                            <input type="email" name="email" class="form-control" placeholder="Nama Email . . . "
                                                value="{{ $model->email }}">

                                        
                                                @error('email')
                                                <div class="text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Telpon</label>
                                            <input type="text" name="phone" class="form-control" placeholder="Nama phone . . . "
                                                value="{{ $model->phone }}">

                                                @error('phone')
                                                <div class="text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Alamat</label>
                                            <input type="text" name="address" class="form-control" placeholder="Nama address . . . "
                                                value="{{ $model->address }}">

                                          
                                                @error('address')
                                                <div class="text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Account Holder</label>
                                            <input type="text" name="account_holder" class="form-control" placeholder="Nama account holder . . . "
                                                value="{{ $model->account_holder }}">

                                           
                                                @error('account_holder')
                                                <div class="text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Account Number</label>
                                            <input type="text" name="account_number" class="form-control" placeholder="Nama account number . . . "
                                                value="{{ $model->account_number }}">

                                           
                                                @error('account_number')
                                                <div class="text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="">Bank Name</label>
                                            <input type="text" name="bank_name" class="form-control" placeholder="Nama bank name . . . "
                                                value="{{ $model->bank_name }}">

                                                @error('bank_name')
                                                <div class="text-danger">{{ $message }}</div>
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
        var rupiah = document.getElementById("selling_price");
        rupiah.addEventListener("keyup", function(e) {
            // tambahkan 'Rp.' pada saat form di ketik
            // gunakan fungsi formatRupiah() untuk mengubah angka yang di ketik menjadi format angka
            rupiah.value = formatRupiah(this.value, "Rp. ");
        });

        var buying_price = document.getElementById("buying_price");
        buying_price.addEventListener("keyup", function(e) {
            // tambahkan 'Rp.' pada saat form di ketik
            // gunakan fungsi formatRupiah() untuk mengubah angka yang di ketik menjadi format angka
            buying_price.value = formatRupiah(this.value, "Rp. ");
        });

        /* Fungsi formatRupiah */
        function formatRupiah(angka, prefix) {
            var number_string = angka.replace(/[^,\d]/g, "").toString(),
                split = number_string.split(","),
                sisa = split[0].length % 3,
                rupiah = split[0].substr(0, sisa),
                ribuan = split[0].substr(sisa).match(/\d{3}/gi);

            // tambahkan titik jika yang di input sudah menjadi angka ribuan
            if (ribuan) {
                separator = sisa ? "." : "";
                rupiah += separator + ribuan.join(".");
            }

            rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
            return prefix == undefined ? rupiah : rupiah ? "Rp. " + rupiah : "";
        }


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

            function previewImage() {
    const image = document.querySelector("#image");
    const imagePreview = document.querySelector("#image-preview");

    const oFReader = new FileReader();
    oFReader.readAsDataURL(image.files[0]);

    oFReader.onload = function (oFREvent) {
        imagePreview.src = oFREvent.target.result;
    };
}


    </script>

@endsection
