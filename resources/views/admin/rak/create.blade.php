@extends('layout.base')

@section('title', 'Data Rak')


@section('content_header')
    <div class="page-header page-header-default">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-cash3"></i> <span class="text-semibold">Data Master Toko/Cabang</span>
                    - Tambah Data Rak</h4>
            </div>

        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><a href="{{ route('rak.index') }}"><i class="active icon-home2 position-left"></i> List
                        Data
                        Rak</a>
                </li>

                <li class="active">Tambah Data Rak</li>
                {{-- <li class="active">Dashboard</li> --}}
            </ul>
        </div>
    </div>
@endsection

@section('content')

    <div class="panel bg-info">
        <div class="panel-heading">
            <em>
                <h6> Halaman ini berguna apabila anda ingin menambah Rak gaji baru</h6>
            </em>
            <div class="heading-elements">
                <ul class="icons-list">
                    <li><a data-action="close"></a></li>
                </ul>
            </div>

        </div>
    </div>

    <form method="post" enctype="multipart/form-data" action="{{ route('rak.store') }}">

        {{ csrf_field() }}

        <div class="panel panel-flat">
            <div class="panel-body">
                <div class="row">
                    <div class="col">
                    </div>
                </div>

                <div class="row">
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">Nama</label>
                            <input type="text" name="name" class="form-control" placeholder="Nama Rak . . . "
                                value="{{ old('name') }}">

                            @if ($errors->has('name'))
                                <div class="text-danger">
                                    {{ $errors->first('name') }}
                                </div>
                            @endif
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">Code</label>
                            <input type="text" name="code" class="form-control" placeholder="Nama Code . . . "
                                value="{{ old('code') }}">

                            @if ($errors->has('code'))
                                <div class="text-danger">
                                    {{ $errors->first('code') }}
                                </div>
                            @endif
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
        var rupiah = document.getElementById("rupiah");
        rupiah.addEventListener("keyup", function(e) {
            // tambahkan 'Rp.' pada saat form di ketik
            // gunakan fungsi formatRupiah() untuk mengubah angka yang di ketik menjadi format angka
            rupiah.value = formatRupiah(this.value, "Rp. ");
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

    </script>

@endsection
