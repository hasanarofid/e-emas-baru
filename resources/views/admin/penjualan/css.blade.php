<style>
/* Gambar dalam kartu produk */
.card-img-top-kita {
    width: 100%;
    height: 150px; /* Atur tinggi gambar agar konsisten */
    object-fit: cover; /* Memastikan gambar menutupi area yang ditentukan tanpa merusak proporsi */
    border-top-left-radius: 0.5rem;
    border-top-right-radius: 0.5rem;
}

/* Styling untuk card body dan title */
.card-body {
    padding: 15px;
    text-align: center; /* Teks di tengah */
    min-height: 100px; /* Menjaga agar area card body memiliki tinggi minimal yang konsisten */
}

.card-title2 {
    font-size: 14px; /* Ukuran font yang konsisten */
    font-weight: 600; /* Berat font */
    color: #333; /* Warna teks */
    margin-bottom: 10px; /* Jarak bawah untuk menjaga jarak dari elemen lain */
}

/* Styling untuk card footer dan align button dan input */
.card-footer {
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-top: 1px solid #e0e0e0; /* Border atas */
    padding: 10px;
    background-color: #f8f9fa;
    border-bottom-left-radius: 0.5rem;
    border-bottom-right-radius: 0.5rem;
}

.card-footer .btn-group {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%; /* Menjaga tombol dan input memenuhi lebar */
}

.card-footer .add-item-btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 8px 12px;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.card-footer .add-item-btn:hover {
    background-color: #0056b3;
}

.card-footer .qty-input {
    width: 60px; /* Lebar input jumlah */
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    text-align: center;
}



</style>