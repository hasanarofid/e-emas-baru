@extends('layout.base')
@section('title', 'Data Penjualan')
@section('content_header')
    <div class="page-header page-header-default">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-cash3"></i> <span class="text-semibold">Transaksi</span>
                    - Penjualan</h4>
            </div>
            <ul class="breadcrumb">
                <li><a href="{{ route('penjualan.list') }}"><i class="active icon-home2 position-left"></i> List
                        Data
                        Penjualan</a>
                </li>

                <li class="active">Tambah Data Penjualan</li>
                {{-- <li class="active">Dashboard</li> --}}
            </ul>
        </div>

       
    </div>
@endsection
@include('admin.penjualan.css')

@section('content')
<div class="panel panel-flat">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
                {{-- <div class="card">
                    <div class="card-body"> --}}
                        <form action="#"  id="form_order">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="name">Cari</label>
                                    <input type="hidden" name="id_barang" name="id_barang">
                                    <input type="text" class="form-control"
                                    id="kode_barang"
                                    name="kode_barang"
                                    placeholder="inputkan kode atau nama barang"
                                    >
                                </div>
                            </div>
                        </form>
                    
                        <form action="{{ route('penjualan.create_order') }}" method="POST" id="create_order">
                            @csrf
                            <div class="row">
                                <!-- Produk list -->
                                <div class="col-lg-9 col-12 mb-lg-0 mb-4">
                                    <div class="row px-0 px-sm-0">
                                        <ul class="nav nav-pills flex-column flex-sm-row mb-4">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="{{ url('all-products') }}">
                                                    <svg class="diamond-icon icon-small" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M12 2L2 9l10 13L22 9l-10-7zm0 2.829L19.178 9 12 18.575 4.822 9 12 4.829zM12 0l10 9-5 13L7 9 12 0zm0 0L2 9l10 13L22 9l-10-7zm0 2.829L19.178 9 12 18.575 4.822 9 12 4.829z"/>
                                                    </svg>
                                                    Semua Produk
                                                </a>
                                            </li>
                                
                                            @foreach($categories as $category)
                                                <li class="nav-item">
                                                    <a class="nav-link" href="{{ url('category/' . $category->slug) }}">
                                                        <svg class="product-icon icon-small" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M12 2l8.4 4.8-3.2 1.6-8.4-4.8L12 2zm0 0L3.6 6.8l3.2 1.6 8.4-4.8L12 2zm0 0v8.8l6.8-3.2v8.4L12 22v-8.8l-6.8 3.2v-8.4L12 2zm0 2.4L7.6 6.8l4.4 2.4 4.4-2.4L12 4.4zm6.8 5.2l-4.4 2.4V18l4.4-2.4v-6.8zm-13.6 0v6.8L10.4 18V11.6l-4.4-2.4z"/>
                                                        </svg>
                                                        {{ $category->name }}
                                                    </a>
                                                </li>
                                            @endforeach
                                        </ul>
                                
                                        <div class="col-12">
                                            <div class="row">
                                                @foreach($products as $product)
                                                <div class="col-md-3 col-lg-3 mb-3 product-card" data-category="{{ $product->category->slug }}" data-id="{{ $product->id }}" data-name="{{ $product->name }}" data-code="{{ $product->code }}" data-stock="{{ $product->quantity }}" data-selling_price="{{ $product->selling_price }}">
                                                    <div class="card h-100">
                                                        @php 
                                                            $path = asset('images/products/' . $product->product_image);
                                                        @endphp
                                                        <img src="{{ $path }}"
                                                            onerror="this.onerror=null; this.src='{{ URL::to('/admin/assets/images/brands/emas.png') }}'"
                                                            alt="product_image" class="card-img-top-kita product-img">
                                                        <div class="card-body">
                                                            <p class="card-title2">{{ $product->name }} - {{ $product->code }} (Rp. {{ formatRupiah($product->selling_price) }})</p>
                                                        </div>
                                                        <div class="card-footer">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn add-item-btn">Add <i class="fa fa-plus-circle"></i></a>
                                                                <input type="text" name="qty[]" value="1" class="form-control qty-input d-none nomor2">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Produk Add-->

                                <!-- Invoice Actions -->
                                <div class="col-lg-3 col-12 invoice-actions">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <div>
                                                <h3 class="card-title">
                                                    {{ __('List Order') }}  
                                                    <div style="color: gray;font-size:10px">Tanggal : {{now()->format('Y-m-d')}}</div>
                                                    <div style="color: gray;font-size:10px">No Invoice : #{{$invoice_no}}</div>
                                                </h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="mb-3">
                                                    <label class="small mb-1" for="customer_id">
                                                        {{ __('Customer') }}
                                                        <span class="text-danger">*</span>
                                                    </label>

                                                    <select class="form-select form-control-solid @error('customer_id') is-invalid @enderror" id="customer_id" name="customer_id" required="required" >
                                                        <option value="">
                                                            Select a customer:
                                                        </option>

                                                        @foreach ($customers as $customer)
                                                            <option value="{{ $customer->id }}" @selected( old('customer_id') == $customer->id)>
                                                                {{ $customer->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                            </div>
                                            <hr>

                                            <h3 class="card-title">
                                                Total Item (<span id="total_item">0</span>)
                                            </h3>
                                            <div id="order-list"></div>
                                        </div>
                                        <div class="card-footer">
                                            <h5>Payment Summary</h5>
                                                            <p>Prices: <span id="prices">0</span></p>
                                                        <!-- Blade template -->
                                                <p id="ppn-section" style="display: {{ $konfig->is_pajak ? 'block' : 'none' }};">
                                                PPN: <span id="tax2">{{ $konfig->pajak }} %</span>
                                                </p>
                                                <p id="discount-section" style="display: {{ $konfig->is_diskon ? 'block' : 'none' }};">
                                                Discount: <span id="discount2">{{ $konfig->diskon }} %</span>
                                                </p>

                                            <hr>
                                            <h5>Pembayaran</h5>
                                            <div class="mb-3">
                                                <label for="id_karat" class="form-label">
                                                    Payment/Pembayaran
                                                    <span class="text-danger">*</span>
                                                </label>
                                                <select onchange="gantiPay(this)" class="form-select form-control-solid" required="required" name="payment_type" id="payment_type">
                                                    <option value="Cash" selected>Cash</option>
                                                    <option value="Transfer">Transfer</option>
                                                    <option value="Debit">Debit</option>
                                                    <option value="Qris">Qris</option>
                                                </select>
                                            </div>

                                            <div class="mb-3" id="cash_pembayaran">
                                                <label for="id_karat" class="form-label">
                                                    Uang Pembayaran
                                                    <span class="text-danger">*</span>
                                                </label>
                                                <input class="form-control nomor"  type="text"  id="pay" required="required" placeholder="inputkan uang customer" >
                                            </div>


                                            <div class="mb-3" id="cash_pembayaran2">
                                                <label for="id_karat" class="form-label">
                                                    Kembalian
                                                    <span class="text-danger">*</span>
                                                </label>
                                                <input class="form-control disabled nomor" disabled="disabled"    type="text" name="kembali" id="kembali" required="required" placeholder=" uang kembalian" >
                                            </div>

                                            <div class="mb-3 hide" id="cash_transfer">
                                                <label for="id_karat" class="form-label">
                                                    Bank
                                                    <span class="text-danger">*</span>
                                                </label>
                                                <input class="form-control"  type="text" name="bank" id="bank"  placeholder="inputkan Bank" >
                                            </div>

                                            

                                        
                                            
                                        
                                            <hr>
                                            <h4>Total:  <span id="total">0</span></h4>
                                            <input type="hidden" class="form-control nomor" name="total_products" id="total_products_val"   >
                                            <input type="hidden" class="form-control nomor" name="subtotal" id="subtotal_val"   >
                                            <input type="hidden" class="form-control nomor" name="tax" id="pajak_val"   >
                                            <input type="hidden" class="form-control nomor" name="diskon" id="diskon_val"   >
                                            <input type="hidden" class="form-control nomor" name="due" id="due"   >
                                            <input type="hidden" class="form-control nomor" name="pay" id="pay2"   >
                                            <input type="hidden" class="form-control nomor" name="total_semua" id="total_semua_val"   >
                                            <button type="submit" class="btn btn-success w-100 add-list  disabled">Simpan</button>
                                        </div>
                                    </div>
                                    
                                </div>
                                <!-- /Invoice Actions -->
                            </div>
                        </form>

                    {{-- </div>
                </div> --}}
            </div>
        </div>
    </div>
</div>
@endsection
@include('admin.penjualan.js')
