@extends('layout.base')


@section('title', 'Data Cuti')


@section('content_header')
    <div class="page-header page-header-default">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-furniture"></i> <span class="text-semibold">Cuti</span>
                    - Pengajuan Cuti</h4>
            </div>

        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><i class="active icon-home2 position-left"></i> List Pengajuan Cuti Pegawai</li>
                {{-- <li class="active">Dashboard</li> --}}
            </ul>
        </div>
    </div>
@endsection

@section('content')
    <!-- Basic datatable -->
    <div class="row">
        <div class="col">
            <div class="panel panel-flat">
                <div class="panel-heading">
                    <div class="heading-elements">
                        <ul class="icons-list">
                            <li><a data-action="collapse"></a></li>
                            <li><a data-action="reload"></a></li>
                            <li><a data-action="close"></a></li>
                        </ul>
                    </div>
                </div>


                <table class="table datatable-basic table-bordered table-striped table-hover">
                    <thead class="bg-primary-300">
                        <tr>
                            <th>ID</th>
                            <th>Nama</th>
                            <th>Tipe Cuti</th>
                            <th>Tgl Pengajuan</th>
                            <th>Keterangan</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if ($pengajuan->count())
                            @foreach ($pengajuan as $key => $p)
                                <tr>
                                    <td>{{ $p->id }}</td>
                                    <td>{{ $p->pegawai->nama }}</td>
                                    <td>{{ $p->tipe_cuti }}</td>
                                    <td>{{ $p->tgl_pengajuan }}</td>
                                    <td>{{ $p->ket }}</td>
                                    <td class="text-center">
                                        <ul class="icons-list">
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                    <i class="icon-menu9"></i>
                                                </a>

                                                <ul class="dropdown-menu dropdown-menu-right">
                                                    <?php $encyrpt = Crypt::encryptString($p->id); ?>
                                                    <li><a href="{{ route('hrdPengajuanCuti.show', $encyrpt) }}"><i
                                                                class="icon-file-eye"></i> Detail </a>
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
    </div>
    <!-- /basic datatable -->
@endsection
