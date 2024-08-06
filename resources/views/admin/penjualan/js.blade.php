@section('custom_script')

    <script>
        document.addEventListener('DOMContentLoaded', function() {
    const fullScreenBtn = document.getElementById('full-screen-btn');
    const closeFullscreenBtn = document.getElementById('close-fullscreen-btn');
    const pageBody = document.querySelector('.page-body');

    const taxRate = {{ $konfig->is_pajak ? $konfig->pajak : 0 }} / 100;
    const discountRate = {{ $konfig->is_diskon ? $konfig->diskon : 0 }} / 100;


    fullScreenBtn.addEventListener('click', function(event) {
        event.preventDefault();
        if (!document.fullscreenElement) {
            if (pageBody.requestFullscreen) {
                pageBody.requestFullscreen();
            } else if (pageBody.mozRequestFullScreen) { // Firefox
                pageBody.mozRequestFullScreen();
            } else if (pageBody.webkitRequestFullscreen) { // Chrome, Safari and Opera
                pageBody.webkitRequestFullscreen();
            } else if (pageBody.msRequestFullscreen) { // IE/Edge
                pageBody.msRequestFullscreen();
            }
        }
    });

    closeFullscreenBtn.addEventListener('click', function(event) {
        event.preventDefault();
        if (document.exitFullscreen) {
            document.exitFullscreen();
        } else if (document.mozCancelFullScreen) { // Firefox
            document.mozCancelFullScreen();
        } else if (document.webkitExitFullscreen) { // Chrome, Safari and Opera
            document.webkitExitFullscreen();
        } else if (document.msExitFullscreen) { // IE/Edge
            document.msExitFullscreen();
        }
    });

    document.addEventListener('fullscreenchange', function() {
        if (document.fullscreenElement) {
            closeFullscreenBtn.style.display = 'block';
        } else {
            closeFullscreenBtn.style.display = 'none';
        }
    });


    function updateSummary(prices) {
        let tax = prices * taxRate;
        let discount = prices * discountRate;
        let total = prices + tax - discount;
        let totalProducts = 0;
        $('.order-qty').each(function() {
            totalProducts += parseInt($(this).text());
        });
        $('#total_products_val').val(totalProducts);

        $('#prices').text('Rp. ' + formatRupiah(prices));
        $('#tax').text('Rp. ' + formatRupiah(tax));
        $('#discount').text('Rp. ' + formatRupiah(discount));
        $('#total').text('Rp. ' + formatRupiah(total));

        $('#subtotal_val').val(prices);
        $('#pajak_val').val(taxRate * 100); // Store as percentage
        $('#diskon_val').val(discountRate * 100); // Store as percentage
        $('#total_semua_val').val(total);
    }

    // Call updateSummary whenever needed to ensure calculations are correct
    updateSummary(totalPrices);

});


    $(document).ready(function() {

        $("#form_order").submit(function(e) {
            e.preventDefault();
        });

        // Handle input event to filter products
        $('#kode_barang').on('input', function() {
            filterProducts();
        });

        // Handle Enter key press to filter products
        $('#kode_barang').keypress(function(e) {
            if (e.which == 13) { // Enter key pressed
                e.preventDefault();
                filterProducts();
            }
        });

        function filterProducts() {
            var searchValue = $('#kode_barang').val().toLowerCase();
            $('.product-card').each(function() {
                var productName = String($(this).data('name')).toLowerCase();
                var productCode = String($(this).data('code')).toLowerCase();
                if (productName.includes(searchValue) || productCode.includes(searchValue)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }

        // Clear and focus input on page load
        $("#kode_barang").val('');
        $("#kode_barang").focus();
          
        $(".nomor").val(0);
        $(".nomor2").val(1);

        function formatRupiah3(angka, format = true) {
    if (format) {
        var reverse = angka.toString().split('').reverse().join(''),
            ribuan = reverse.match(/\d{1,3}/g);
        ribuan = ribuan.join('.').split('').reverse().join('');
        return ribuan;
    } else {
        return angka;
    }
}
    $('form').submit(function(event) {
        event.preventDefault(); // Prevent the form from submitting normally

        // Get the total amount and payment amount
        let totalAmount =   parseInt($('#total_semua_val').val().replace(/[^\d]/g, ''));
        let paymentAmount = parseInt($('#pay').val().replace(/[^\d]/g, ''));
      
      

        // Check if the payment amount is less than the total amount
        if (paymentAmount < totalAmount) {
            // Show a warning message using SweetAlert
            Swal.fire({
                icon: 'warning',
                title: 'Peringatan!',
                text: 'Jumlah pembayaran tidak mencukupi untuk total pembelian!',
            });
            return; // Exit the function to prevent form submission
        }

        // If the payment amount is sufficient, submit the form
        this.submit();
    });

        let totalItems = 0;
        let totalPrices = 0;
        const taxRate = {{ $konfig->pajak }} / 100; // Convert percentage to decimal
        const discountRate = {{ $konfig->diskon }} / 100; // Convert percentage to decimal

   // Function to handle deletion of an order item
    $('#order-list').on('click', '.fa-trash', function() {
        let orderItem = $(this).closest('.order-item');
        let itemPrice = orderItem.data('price');
        let itemQty = orderItem.data('qty');
        let productId = orderItem.data('id'); // Get the product ID from the order item

        // Decrement the total item count
        totalItems--;
        $('#total_item').text(totalItems);

        // Update total prices
        totalPrices -= itemPrice * itemQty;
        updateSummary(totalPrices);

        // Remove the order item from the list
        orderItem.remove();

        // Reset the corresponding product card button
        let productCard = $(`.product-card[data-id='${productId}']`);
        let $btn = productCard.find('.btn-success').removeClass('btn-success btn-sm').addClass('btn-primary add-item-btn ');
        let $input = productCard.find('.qty-input');

        $btn.html('Add Item <i class="fas fa-plus-circle"></i>');
        $btn.prop('disabled', false); // Enable the button
        $input.addClass('d-none').val(1);

        // Disable the submit button if there are no items in the list
        if (totalItems === 0) {
            $(".add-list").addClass('disabled');
        }
    });

    // Function to handle adding a product to the order list
    $('.add-item-btn').on('click', function(e) {
        e.preventDefault();

        let $btn = $(this);
        if ($btn.hasClass('btn-success')) {
            // Prevent adding the product again if it has already been selected
            return;
        }

        let $input = $btn.siblings('.qty-input');
        let productCard = $btn.closest('.product-card');
        let productImgSrc = productCard.find('.product-img').attr('src');
        let productName = productCard.find('.card-title').text().split(' (')[0];
        let productPrice = productCard.data('selling_price');
        let productQty = parseInt($input.val());
        let productId = productCard.data('id');
        let productStock = productCard.data('stock');

        if (productQty <= 0 || productQty > productStock) {
            Swal.fire({
                icon: 'warning',
                title: 'Peringatan!',
                text: 'Jumlah yang dimasukkan melebihi stok yang tersedia!',
            });
            $input.val(productStock);
            return;
        }

        // Change the button text, class, and icon
        $btn.removeClass('btn-primary add-item-btn').addClass('btn-success btn-sm');
        $btn.html('<i class="fas fa-check-circle"></i>');

        // Show the input field
        $input.removeClass('d-none').focus();

        // Increment the total item count
        totalItems++;
        $('#total_item').text(totalItems);

        // Enable the "Simpan" button if it's disabled
        $(".add-list").removeClass('disabled');

        // Update total prices
        totalPrices += productPrice * productQty;
        updateSummary(totalPrices);

        // Append product details to order list
        let orderItemHtml = `
            <div class="order-item d-flex align-items-center mb-2 bg-gray" data-price="${productPrice}" data-qty="${productQty}" data-id="${productId}">
                <input type="hidden" class="form-control" name="product_id[]" value="${productId}">
                <input type="hidden" class="form-control quantitynya" name="quantity[]" value="${productQty}">
                <input type="hidden" class="form-control" name="price[]" value="${productPrice}">
                <input type="hidden" class="form-control" name="subprice[]" value="${productPrice * productQty}">
                <img src="${productImgSrc}" class="order-img mr-2" style="width: 50px; height: 50px; margin-right: 5px;">
                <div class="flex-grow-1 ml-2">
                    <p class="mb-0">${productName}</p>
                    <p class="mb-0">Rp. ${formatRupiah(productPrice)} x <span class="order-qty">${productQty}</span></p>
                </div>
                <i class="fa fa-trash ml-auto" aria-hidden="true" style="cursor: pointer; color: red; margin-right: 5px;"></i>
            </div>
        `;

        $('#order-list').append(orderItemHtml);

        // Attach change event to quantity input
        $input.on('change', function() {
            let newQty = parseInt($input.val());
            let productStock = productCard.data('stock');

            if (newQty > productStock) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Peringatan!',
                    text: 'Jumlah yang dimasukkan melebihi stok yang tersedia!',
                });
                $input.val(productStock);
                newQty = productStock;
            }

            let orderItem = $('#order-list').find('.order-item[data-id="' + productId + '"]');
            let oldQty = orderItem.data('qty');
            orderItem.data('qty', newQty);
            orderItem.find('.quantitynya').val(newQty);
            orderItem.find('.order-qty').text(newQty);

            // Update total prices
            totalPrices += productPrice * (newQty - oldQty);
            updateSummary(totalPrices);
        });
    });



    function formatRupiah(angka) {
        return angka.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }

    function updateSummary(prices) {
        let tax = prices * taxRate;
        let discount = prices * discountRate;
        let total = prices + tax - discount;
        let totalProducts = 0;
        $('.order-qty').each(function() {
            totalProducts += parseInt($(this).text());
        });
        $('#total_products_val').val(totalProducts);

        $('#prices').text('Rp. ' + formatRupiah(prices));
        $('#tax').text('Rp. ' + formatRupiah(tax));
        $('#discount').text('Rp. ' + formatRupiah(discount));
        $('#total').text('Rp. ' + formatRupiah(total));

        $('#subtotal_val').val(prices);
        $('#pajak_val').val({{ $konfig->pajak }});
        $('#diskon_val').val({{ $konfig->diskon }});
        $('#total_semua_val').val(total);
    }


        $('.nav-link').on('click', function(e) {
            e.preventDefault();
            
            // Remove active class from all nav-links
            $('.nav-link').removeClass('active');
            
            // Add active class to clicked nav-link
            $(this).addClass('active');
            
            // Get the category slug from the clicked link
            var categorySlug = $(this).attr('href').split('/').pop();
            
            // Show all products if "Semua Produk" is clicked
            if (categorySlug === 'all-products') {
                $('.product-card').show();
            } else {
                // Hide all products
                $('.product-card').hide();
                
                // Show products that match the selected category
                $('.product-card[data-category="' + categorySlug + '"]').show();
            }
        });

        // Fungsi untuk menghapus karakter selain angka
    function restrictNonNumbers(event) {
        var keyCode = event.which ? event.which : event.keyCode;
        var charCode = String.fromCharCode(keyCode);
        if (!/\d/.test(charCode)) {
            event.preventDefault();
        }
    }

    // Fungsi untuk memformat angka sebagai Rupiah
    function formatRupiah2(angka) {
        var isNegative = angka < 0; // Check if the number is negative
        angka = Math.abs(angka); // Convert negative number to positive for formatting
        var numberString = angka.toString().replace(/[^\d]/g, ''),
            sisa = numberString.length % 3,
            rupiah = numberString.substr(0, sisa),
            ribuan = numberString.substr(sisa).match(/\d{3}/g);

        if (ribuan) {
            var separator = sisa ? '.' : '';
            rupiah += separator + ribuan.join('.');
        }

        return (isNegative ? '-' : '')  + rupiah; // Add Rp. and the negative sign if applicable
    }

    // Fungsi untuk menghitung dan menetapkan uang kembalian
    function calculateChange() {
        var pay = parseInt($('#pay').val().replace(/[^\d]/g, '')); // Ambil nilai input bayar dan hapus karakter selain angka
        var totalSemua = parseInt($('#total_semua_val').val().replace(/[^\d]/g, '')); // Ambil nilai total semua dan hapus karakter selain angka
        var due = pay - totalSemua; // Hitung uang kembalian

        // Set nilai uang kembalian ke dalam input #due
        $('#pay').val(formatRupiah(pay));
        $('#pay2').val(pay);
        $('#due').val(due);
        $('#kembali').val(formatRupiah2(due));
    }

    // Event saat nilai input #pay berubah
    $('#pay').on('input', function() {
        // Memanggil fungsi untuk menghitung uang kembalian
        calculateChange();
    });

    // Event saat tombol di keyboard ditekan
    $('#pay').on('keypress', restrictNonNumbers);

   

    });


    function gantiPay(obj){
        var paymet = $(obj).val();
        if(paymet == 'Cash'){
            $("#cash_pembayaran").removeClass('hide');
            $("#cash_transfer").addClass('hide');
        }else if(paymet == 'Transfer'){
            $("#cash_transfer").removeClass('hide');
            $("#cash_pembayaran").addClass('hide');
        }else{
            $("#cash_pembayaran").addClass('hide');
            $("#cash_transfer").addClass('hide');
        }
    }

    </script>

@endsection
