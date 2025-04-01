<!-- Modal Konfirmasi -->
<div class="modal fade" id="confirmSubmitModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Konfirmasi Pengumpulan</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                Apakah Anda yakin ingin menyelesaikan asesmen ini? Jawaban yang sudah disimpan akan diproses.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                <button type="button" class="btn btn-primary" onclick="submitAssessment()">Ya, Selesaikan</button>
            </div>
        </div>
    </div>
</div>

<!-- Skrip JavaScript untuk Submit Assessment -->
<script>
    function submitAssessment() {
        var assessmentId = {{ $assessment->id ?? 'null' }}; // Pastikan ID ada

        if (!assessmentId) {
            alert("Terjadi kesalahan: ID asesmen tidak ditemukan.");
            return;
        }

        $.ajax({
            url: "/literacy/student/assessment/submit/" + assessmentId, // Perbaiki URL sesuai route
            type: "POST",
            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content') // Pastikan CSRF Token dikirim
            },
            success: function(response) {
                alert(response.message);
                window.location.href = "/literacy/student/assessments"; // Redirect ke halaman indeks asesmen
            },
            error: function(xhr) {
                console.error(xhr);
                alert(xhr.responseJSON?.error || "Gagal menyelesaikan asesmen.");
            }
        });

        $('#confirmSubmitModal').modal('hide'); // Tutup modal setelah klik tombol
    }
</script>