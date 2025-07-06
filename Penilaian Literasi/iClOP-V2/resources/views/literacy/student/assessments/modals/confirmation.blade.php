@include('literacy.student.assessments.modals.loading')

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
    function showLoadingFeedback() {
        $('#loadingIcon').show();
        $('#successIcon').hide();
        $('#errorIcon').hide();
        $('#loadingText').text("Mohon tunggu, sedang menyelesaikan asesmen...");
        $('#loadingModal').modal({backdrop: 'static', keyboard: false});
        $('#loadingModal').modal('show');
    }

    function showSuccessFeedback() {
        $('#loadingIcon').hide();
        $('#successIcon').show();
        $('#errorIcon').hide();
        $('#loadingText').text("Berhasil menyelesaikan asesmen!");
    }

    function showErrorFeedback(message) {
        $('#loadingIcon').hide();
        $('#successIcon').hide();
        $('#errorIcon').show();
        $('#loadingText').text(message || "Terjadi kesalahan saat menyelesaikan asesmen.");
    }

    function submitAssessment() {
        var assessmentId = {{ $assessment->id ?? 'null' }};

        if (!assessmentId) {
            alert("Terjadi kesalahan: ID asesmen tidak ditemukan.");
            return;
        }

        $('#confirmSubmitModal').modal('hide');
        showLoadingFeedback();

        $.ajax({
            url: "/literacy/student/assessment/submit/" + assessmentId,
            type: "POST",
            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
            },
            success: function(response) {
                showSuccessFeedback();
                setTimeout(function() {
                    $('#loadingModal').modal('hide');
                    window.location.href = "/literacy/student/assessments";
                }, 2000);
            },
            error: function(xhr) {
                console.error(xhr);
                showErrorFeedback(xhr.responseJSON?.error || "Gagal menyelesaikan asesmen.");
            }
        });
    }
</script>