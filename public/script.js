document.getElementById("bookingForm").addEventListener("submit", function(e) {
    e.preventDefault(); // Mencegah refresh halaman

    // Ambil data dari form
    const name = document.getElementById("name").value;
    const car = document.getElementById("car").value;
    const date = document.getElementById("date").value;

    // Validasi data (opsional)
    if (!name || !car || !date) {
        alert("Mohon lengkapi semua field!");
        return;
    }

    // Tampilkan hasil booking
    const result = `
        <p>Terima kasih, <b>${name}</b>!</p>
        <p>Anda telah berhasil memesan mobil <b>${car}</b> untuk tanggal <b>${date}</b>.</p>
    `;
    document.getElementById("result").innerHTML = result;
});
