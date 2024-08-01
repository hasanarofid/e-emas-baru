@extends('layout.base')

@section('title', 'Data Produk')


@section('content_header')
    <div class="page-header page-header-default">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-cash3"></i> <span class="text-semibold">Data Master Toko/Cabang</span>
                    - List Data Produk</h4>
            </div>

        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><i class="active icon-home2 position-left"></i> List Data Produk</li>
                {{-- <li class="active">Dashboard</li> --}}
            </ul>
        </div>
    </div>
@endsection

@section('content')
    <div class="panel bg-info">
        <div class="panel-heading">
            <em>
                <h6>Pada halaman ini terdapat list daftar Produk  yang ada di dalam perusahaan ini. masing-masing
                    Produk bisa
                    dihapus dan diedit.
                </h6>
            </em>
            <div class="heading-elements">
                <ul class="icons-list">
                    <li><a data-action="close"></a></li>
                </ul>
            </div>

        </div>
    </div>

    <div class="panel panel-flat">
        <div class="panel-heading">
            <a href="{{ route('produk.create') }}"><i class="icon-file-plus"></i> Tambah Data Produk </a>
        </div>

        <div class="panel-body table-responsive">

            <table class="table datatable-basic table-bordered table-striped table-hover table-xs">
                <thead class="bg-primary">
                    <tr>
                        <th>No</th>
                        <th>Gambar</th>
                        <th>Nama</th>
                        <th>Kode</th>
                        <th>Kategori</th>
                        <th>Satuan</th>
                        <th>Karat</th>
                        <th>Tipe</th>
                        <th>Rak</th>
                        <th>Jumlah</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1; ?>
                    @if ($model->count())
                        @foreach ($model as $key => $p)
                            @php
                                $encyrpt = Crypt::encryptString($p->id);
                            @endphp

                            <tr>
                                <td>{{ $i++ }}</td>
                                <td>
                                    <div class="text-center">
                                        @php $path =Storage::url('images/produk/'.$p->dokumentasi); @endphp
                                        <img src="{{ url($path) }}"
                                            onerror="this.onerror=null; this.src='{{ URL::to('/admin/assets/images/brands/emas.png') }}'"
                                            alt="Dokumentasi" width="160">
                                    </div>
                                    {{ $p->dokumentasi }}
                                </td>
                                <td>{{ $p->name }}</td>
                                <td>{{ $p->code }}</td>
                                <td>{{ $p->category->name }}</td>
                                <td>{{ $p->karat->name }}</td>
                                <td>{{ $p->unit->name }}</td>
                                <td>{{ $p->tipe->name }}</td>
                                <td>{{ $p->rak->name }}</td>

                                <td>{{ $p->quantity }}</td>
                                <td class="text-center">
                                    <ul class="icons-list">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                <i class="icon-menu9"></i>
                                            </a>

                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <?php $encyrpt = Crypt::encryptString($p->id); ?>
                                                <li><a href="{{ route('produk.destroy', $encyrpt) }}"><i
                                                            class=" icon-trash"></i> Hapus</a>
                                                </li>
                                                <li><a href="{{ route('produk.edit', $encyrpt) }}"><i
                                                            class=" icon-pencil5"></i> Edit</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        @endforeach
                    @endif

                </tbody>
            </table>
        </div>
    </div>
    <!-- /basic datatable -->

@endsection
