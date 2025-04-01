<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        /* Additional styles */
        .sidebar {
            background-color: #FFFFFF;
            width: 245px;
        }

        .content {
            min-height: 400px;
            background-color: #FFFFFF;
            padding: 20px;
        }


        /* NAV LINK */
        .nav-link {
            display: flex;
            align-items: center;
        }

        .nav-link:hover {
            color: blue !important;
        }

        .nav-link .icon {
            margin-right: 5px;
        }

        .custom-button {
            color: #A0A0A0;
            /* Warna teks saat tombol normal */
            transition: background-color 0.3s, color 0.3s;
            /* Efek transisi ketika hover */
            /* outline: none; */
        }

        .custom-button:hover {
            background-color: #007BFF;
            /* Warna latar belakang saat tombol dihover */
            color: white;
            /* Warna teks saat tombol dihover menjadi putih */
        }

        .custom-card {
            padding: 30px;
            width: 395px;
            height: 280px;
            background-color: #FFFFFF;
            border-radius: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .circle-image {
            width: 79px;
            height: 79px;
            border-radius: 50%;
        }

        .custom-title {
            font-weight: 600;
            font-size: 25px;
            color: #252525;
            font-family: 'Poppins', sans-serif;
            margin-top: 10px;
        }

        .custom-subtitle {
            font-weight: 400;
            font-size: 20px;
            color: #898989;
            font-family: 'Poppins', sans-serif;
            margin-top: 10px;
        }

        .custom-button {
            width: 335px;
            height: 43px;
            border-radius: 10px;
            background-color: #EAEAEA;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 15px;
            outline: none;
        }

        .custom-button-detail {
            width: 180px;
            height: 45px;
            border-radius: 10px;
            background-color: #EAEAEA;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 15px;
            margin-left: auto;
            color: #A0A0A0;
            /* Warna teks saat tombol normal */
            transition: background-color 0.3s, color 0.3s;
            /* Efek transisi ketika hover */
        }

        .custom-button-detail:hover {
            background-color: #007BFF;
            /* Warna latar belakang saat tombol dihover */
            color: white;
            /* Warna teks saat tombol dihover menjadi putih */
        }

        .button-text {
            font-weight: 500;
            font-size: 15px;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            margin-left: 10px;
            margin-right: 10px;
            text-decoration: none;
            color: #A0A0A0;
        }

        .button-text:hover {
            text-decoration: none;
            color: #fff;
        }

        .text {
            font-size: 15px;
            font-family: 'Poppins', sans-serif;
        }

        .sidebar-right-shadow {
            box-shadow: 1px 0px 8px rgba(0, 0, 0, 0.1);
            /* Menambahkan bayangan ke sisi kanan */
        }
    </style>

    <title>Tab Example</title>

    <!-- CSS Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- JavaScript Bootstrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Place these in the <head> section -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>

    <script src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script>

        // Define the font files in base64
        var robotoRegularBase64 = 'BASE64_STRING_OF_ROBOTO_REGULAR';
        var robotoBoldBase64 = 'BASE64_STRING_OF_ROBOTO_BOLD';
        var robotoItalicBase64 = 'BASE64_STRING_OF_ROBOTO_ITALIC';
        var robotoBoldItalicBase64 = 'BASE64_STRING_OF_ROBOTO_BOLDITALIC';

        // Prepare the virtual file system object
        var vfs = {
            "Roboto-Regular.ttf": robotoRegularBase64,
            "Roboto-Bold.ttf": robotoBoldBase64,
            "Roboto-Italic.ttf": robotoItalicBase64,
            "Roboto-BoldItalic.ttf": robotoBoldItalicBase64
        };
    </script>
    <link rel="icon" href="./images/logo.png" type="image/png">
    <meta name="csrf-token" content="{{ csrf_token() }}">
</head>

<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg" style="background-color: #FEFEFE;">
        <div class="container-fluid">
            <!-- <a class="navbar-brand" href="#">Navbar</a> -->
            <img src={{asset("./images/logo.png")}} alt="logo" width="104" height="65">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="mx-auto">
                    <ul class="navbar-nav mb-2 mb-lg-0 justify-content-center">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/dashboard-student">Dashboard
                                Student</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Learning</a>
                        </li>
                    </ul>
                </div>
                <div class="dropdown">
                    <p style="margin-top: 10px; margin-right: 10px;">{{auth()->user()->name}}
                        <img src="{{ asset('./images/Group.png') }}" alt="Group"
                            style="height: 50px; margin-right: 10px;">
                        <i class="fas fa-chevron-down" style="color: #0079FF;"></i>
                    <div class="dropdown-content" id="dropdownContent">
                        <form id="logout-form" action="{{ route('logout') }}" method="POST">
                            @csrf
                            <a href="#"
                                onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Logout</a>
                        </form>

                    </div>
                    </p>
                </div>
                <!-- <button class="btn btn-primary custom-button-sign-up" onclick="window.location.href='register.html'">Sign Up</button> -->
            </div>
        </div>
    </nav>
    <!-- ------------------------------------------------------------------------------------------ -->

    <div class="container-fluid">
        <div class="row">
            <!-- SIDEBAR -->
            <nav class="col-md-2 d-none d-md-block sidebar sidebar-right-shadow" style="position: sticky; top: 20px;">
                <div class="sidebar-sticky" style="margin-top: 20px;">
                    <ul class="nav flex-column">
                        <li class="nav-item" style="margin-bottom: 40px;">
                            <div class="row align-items-start">
                                <div class="col">
                                    <p style="font-weight: 600; font-size: 14px; color: #34364A; margin-left: 15px;">
                                        STUDENT WEBAPPS
                                    </p>
                                </div>
                                <div class="col">
                                    <img src="{{asset('./images/literacy/literacy.png')}}" alt="learning-logo"
                                        style="height: 45px;">
                                </div>
                            </div>
                        </li>
    
                        <li class="nav-item">
                            <div class="row align-items-start">
                                <div class="col-2">
                                    <i class="fas fa-question-circle"
                                        style="margin-top: 12px; margin-left: 15px; color: #676767;"></i>
                                </div>
                                <div class="col">
                                    <a class="nav-link active" href="" style="color: #34364A;"
                                        id="manageQuestionsLink">Materials</a>
                                </div>
                            </div>
                        </li>
    
                        <li class="nav-item">
                            <div class="row align-items-start">
                                <div class="col-2">
                                    <i class="fas fa-chart-bar"
                                        style="margin-top: 12px; margin-left: 15px; color: #676767;"></i>
                                </div>
                                <div class="col">
                                    <a class="nav-link" href="{{ route('literacy_assessments') }}"
                                        style="color: #34364A;">Assessments</a>
                                </div>
                            </div>
                        </li>
    
                        <li class="nav-item">
                            <div class="row align-items-start">
                                <div class="col-2">
                                    <i class="fas fa-sign-out-alt"
                                        style="margin-top: 12px; margin-left: 15px; color: #676767;"></i>
                                </div>
                                <div class="col">
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST">
                                        @csrf
                                        <a class="nav-link" href="#" style="color: #34364A;"
                                            onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Logout</a>
                                    </form>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
    
            <!-- CONTENT DAN NAVIGASI SOAL -->
            @php
                $multipleChoiceQuestions = $questions->filter(fn($q) => $q->options->isNotEmpty());
                $essayQuestions = $questions->filter(fn($q) => $q->options->isEmpty());
                $multipleChoiceNumber = 0;
                $essayNumber = 0;
            @endphp

            <main class="col-md-8">
                <div class="grid grid-cols-12 gap-6 p-6">
                    <div class="col-span-12 lg:col-span-9 space-y-8">
                        <!-- Bagian Pilihan Ganda -->
                        @if ($multipleChoiceQuestions->isNotEmpty())
                            <h4 class="text-base font-semibold mt-6">Bagian 1: Pilihan Ganda</h4>
                            <p class="text-gray-500 text-sm mb-3">Pilih salah satu jawaban yang paling tepat.</p>

                            @foreach ($multipleChoiceQuestions as $question)
                                @php 
                                    $multipleChoiceNumber++; 
                                    $savedAnswer = optional($question->answers->where('assessment_id', $assessment->id)->first());
                                @endphp
                                <div class="bg-white shadow-md rounded-lg p-4 border mb-4" id="question-mc-{{ $multipleChoiceNumber }}">
                                    <h5 class="text-base font-medium mb-3">
                                        <span class="whitespace-pre-line">{{ $multipleChoiceNumber }}. {{ $question->question_text }}</span>
                                    </h5>

                                    <div class="mt-3">
                                        <div class="space-y-3">
                                            @foreach ($question->options as $option)
                                                <label class="block p-3 border rounded-sm cursor-pointer w-100">
                                                    <input type="radio" name="question_{{ $question->id }}" 
                                                    value="{{ $option->id }}" class="form-radio"
                                                    onchange="saveAnswer('{{ $question->id }}', '{{ $option->id }}'); updateQuestionUI('mc', '{{ $question->id }}');"
                                                    {{ $savedAnswer && $savedAnswer->option_id == $option->id ? 'checked' : '' }}>
                                                    <span>{{ $option->option_text }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        @endif

                        <!-- Bagian Isian -->
                        @if ($essayQuestions->isNotEmpty())
                            <h4 class="text-base font-semibold mt-6">Bagian 2: Isian</h4>
                            <p class="text-gray-500 text-sm mb-3">Jawablah pertanyaan berikut dengan jawaban yang sesuai.</p>

                            @foreach ($essayQuestions as $question)
                                @php 
                                    $essayNumber++; 
                                    $savedAnswer = optional($question->answers->where('assessment_id', $assessment->id)->first());
                                @endphp
                                <div class="bg-white shadow-md rounded-lg p-4 border mb-4" id="question-essay-{{ $essayNumber }}">
                                    <h5 class="text-base font-medium mb-3">
                                        <span class="whitespace-pre-line">{{ $essayNumber }}. {{ $question->question_text }}</span>
                                    </h5>

                                    <div class="mt-3">
                                        <textarea name="question_{{ $question->id }}"
                                            class="w-100 h-24 p-3 border rounded-lg focus:ring focus:ring-blue-200"
                                            placeholder="Masukkan jawaban Anda di sini..."
                                            oninput="saveAnswer('{{ $question->id }}', this.value); updateQuestionUI('essay', '{{ $question->id }}');">{{ $savedAnswer ? $savedAnswer->answer_text : '' }}</textarea>
                                    </div>
                                </div>
                            @endforeach
                        @endif
                    </div>
                </div>
            </main>
    
            <!-- NAVIGASI NOMOR SOAL -->
            <aside class="col-md-2 d-flex flex-column align-items-end" style="position: sticky; top: 20px; height: fit-content;">
                <div class="card p-3">
                    <h5 class="font-bold mb-3">Navigasi Soal</h5>
            
                    <!-- Navigasi Pilihan Ganda -->
                    <div class="mb-3">
                        <h6 class="font-bold text-secondary">Pilihan Ganda</h6>
                        <div class="d-flex flex-wrap gap-2">
                            @php $multipleChoiceNumber = 0; @endphp
                            @foreach ($questions as $question)
                                @if ($question->options->isNotEmpty())
                                    @php 
                                        $multipleChoiceNumber++; 
                                        $savedAnswer = $question->answers->where('assessment_id', $assessment->id)->first();
                                        $btnClass = $savedAnswer && $savedAnswer->option_id ? 'btn-primary border-white' : 'btn-outline-secondary';
                                    @endphp
                                    <button id="nav-mc-{{ $multipleChoiceNumber }}" 
                                        class="btn {{ $btnClass }}" 
                                        onclick="navigateToQuestion('mc', {{ $multipleChoiceNumber }})"
                                        data-question-id="{{ $question->id }}">
                                        {{ $multipleChoiceNumber }}
                                    </button>
                                @endif
                            @endforeach
                        </div>
                    </div>
            
                    <!-- Navigasi Isian -->
                    <div class="mb-3">
                        <h6 class="font-bold text-secondary">Isian</h6>
                        <div class="d-flex flex-wrap gap-2">
                            @php $essayNumber = 0; @endphp
                            @foreach ($questions as $question)
                                @if ($question->options->isEmpty())
                                    @php 
                                        $essayNumber++; 
                                        $savedAnswer = $question->answers->where('assessment_id', $assessment->id)->first();
                                        $btnClass = $savedAnswer && $savedAnswer->answer_text ? 'btn-primary border-white' : 'btn-outline-secondary';
                                    @endphp
                                    <button id="nav-essay-{{ $essayNumber }}" 
                                        class="btn {{ $btnClass }}" 
                                        onclick="navigateToQuestion('essay', {{ $essayNumber }})"
                                        data-question-id="{{ $question->id }}">
                                        {{ $essayNumber }}
                                    </button>
                                @endif
                            @endforeach
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="button" class="btn btn-primary w-100 py-2 fw-semibold" onclick="checkUnansweredQuestions()">
                            Selesai
                        </button>
                    </div>
                </div>
            </aside>
            @include('literacy.student.assessments.modals.confirmation')
            @include('literacy.student.assessments.modals.unanswered_warning')                                           
        </div>
    </div>

    <!-- The Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 80%;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><span id="span_title"></span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" style="margin-left: 10px; width: 160px;"
                        onclick="materialDetailPage()">
                        <i class="fas fa-key" style="margin-right: 5px;"></i>Enroll Material
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function checkUnansweredQuestions() {
            let unansweredCount = 0;

            // Cek soal pilihan ganda (radio button)
            @foreach ($multipleChoiceQuestions as $question)
                if (!$("input[name='question_{{ $question->id }}']:checked").val()) {
                    unansweredCount++;
                }
            @endforeach

            // Cek soal isian (textarea)
            @foreach ($essayQuestions as $question)
                if (!$("textarea[name='question_{{ $question->id }}']").val().trim()) {
                    unansweredCount++;
                }
            @endforeach

            console.log("Soal yang belum dijawab:", unansweredCount); // Debugging

            if (unansweredCount > 0) {
                $("#unansweredCount").text(unansweredCount);
                $("#unansweredWarningModal").modal("show"); // Tampilkan modal peringatan
            } else {
                $("#confirmSubmitModal").modal("show"); // Tampilkan modal konfirmasi
            }
        }
    </script>
    <script>
        async function saveAnswer(questionId, answer) {
            const assessmentId = "{{ $assessment->id }}";

            try {
                const response = await fetch(`/literacy/student/assessments/${assessmentId}/save-answer`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').getAttribute("content")
                    },
                    body: JSON.stringify({
                        question_id: questionId,
                        answer: answer
                    })
                });

                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }

                const data = await response.json();
                console.log("Jawaban berhasil disimpan:", data);
            } catch (error) {
                console.error("Gagal menyimpan jawaban:", error);
            }
        }

        // function updateNavigationButton(questionId) {
        //     const navButton = document.querySelector(`button[data-question-id='${questionId}']`);

        //     if (navButton) {
        //         navButton.classList.remove("btn-outline-secondary");
        //         navButton.classList.add("btn-primary", "border-white");
        //     }
        // }
    </script>

    <script>
        function navigateToQuestion(type, number) {
            const questionElement = document.getElementById(`question-${type}-${number}`);
            if (questionElement) {
                questionElement.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }
    </script>

    <script>
        function updateQuestionUI(type, questionId) {
            const navButton = document.querySelector(`button[data-question-id='${questionId}']`);
            const questionCard = document.getElementById(`question-${type}-${questionId}`);

            if (navButton) {
                navButton.classList.remove("btn-outline-secondary");
                navButton.classList.add("btn-primary", "border-white");
            }

            if (questionCard) {
                questionCard.classList.add("border-blue-500");
            }
        }
    </script>

    <!-- JavaScript untuk mengubah konten tab -->
    <script>
        function materialModal(id, title, controller) {
            $("#id").val(id);
            $("#title").val(title);
            $("#controller").val(controller);
            $("#span_title").text(title);
        }

        function materialDetailPage() {
            var csrfToken = "{{ csrf_token() }}";
            let id = $("#id").val();
            let title = $("#title").val();
            let controller = $("#controller").val();
            window.location.href = "{{ route('php_material_detail') }}?phpid=" + id + "&start=" + controller;

            /*$.ajax({
                type: "POST",
                data: {
                    id: id,
                    title: title,
                    _token: csrfToken // Menambahkan token CSRF ke dalam data permintaan
                },
                dataType: 'html',
                url: "{{ route('php_material_detail') }}",
            success: function(res) {

            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });*/
        }

        // Fungsi untuk mengubah warna ikon, teks, dan link menjadi biru
        function changeColor(id) {
            var icon = document.getElementById(id + 'Icon');
            var link = document.getElementById(id + 'Link');
            var text = document.getElementById(id + 'Text');

            // Mengembalikan warna ikon, teks, dan link ke warna awal
            var icons = document.getElementsByClassName('fas');
            var links = document.getElementsByClassName('nav-link');
            var texts = document.getElementsByClassName('nav-link-text');
            for (var i = 0; i < icons.length; i++) {
                icons[i].style.color = '#676767';
            }
            for (var j = 0; j < links.length; j++) {
                links[j].style.color = '#34364A';
            }
            for (var k = 0; k < texts.length; k++) {
                texts[k].style.color = '#34364A';
            }

            // Mengubah warna ikon, teks, dan link menjadi biru
            icon.style.color = '#1A79E3';
            link.style.color = '#1A79E3';
            text.style.color = '#1A79E3';
        }

        // Menambahkan event listener pada setiap link
        var manageUsersLink = document.getElementById('manageUsersLink');
        manageUsersLink.addEventListener('click', function () {
            changeColor('manageUsers');
        });

        var manageMaterialsLink = document.getElementById('manageMaterialsLink');
        manageMaterialsLink.addEventListener('click', function () {
            changeColor('manageMaterials');
        });

        var manageMaterialsLink = document.getElementById('manageQuestionsLink');
        manageQuestionsLink.addEventListener('click', function () {
            changeColor('manageQuestions');
        });

        var startLearningLink = document.getElementById('learningLink');
        startLearningLink.addEventListener('click', function () {
            changeColor('learning');
        });

        var validationLink = document.getElementById('validationLink');
        validationLink.addEventListener('click', function () {
            changeColor('validation');
        });

        var rankLink = document.getElementById('rankLink');
        rankLink.addEventListener('click', function () {
            changeColor('rank');
        });

        var settingsLink = document.getElementById('settingsLink');
        settingsLink.addEventListener('click', function () {
            changeColor('settings');
        });


        // Function to show the selected content based on sidebar link click
        // function showContent(contentId) {
        //     // Hide all content divs
        //     var contentDivs = document.getElementsByClassName('content');
        //     for (var i = 0; i < contentDivs.length; i++) {
        //         contentDivs[i].style.display = 'none';
        //     }

        //     // Show the selected content div
        //     var selectedContent = document.getElementById(contentId);
        //     if (selectedContent) {
        //         selectedContent.style.display = 'block';
        //     }
        // }

        function showContent(contentId) {
            var contentDivs = document.getElementsByClassName('content');
            for (var i = 0; i < contentDivs.length; i++) {
                contentDivs[i].style.display = 'none';
            }

            var selectedContent = document.getElementById(contentId);
            if (selectedContent) {
                selectedContent.style.display = 'block';
            }
        }

        //  Change TAB
        $(document).ready(function () {
            $('#users-tab').on('click', function (e) {
                e.preventDefault();
                $('#materials-tab').removeClass('active');
                $(this).tab('show');
            });

            $('#materials-tab').on('click', function (e) {
                e.preventDefault();
                $('#users-tab').removeClass('active');
                $(this).tab('show');
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#dropdownContainer").click(function () {
                $("#dropdownContainer").toggleClass("active");
            });
            $("#dropdownContent").click(function (e) {
                e.stopPropagation();
            });
            $(document).click(function () {
                $("#dropdownContainer").removeClass("active");
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#dropdownContainer").click(function () {
                $("#dropdownContainer").toggleClass("active");
            });
            $("#dropdownContent").click(function (e) {
                e.stopPropagation();
            });
            $(document).click(function () {
                $("#dropdownContainer").removeClass("active");
            });
            $('#progressTable').DataTable({
                // Configuration options
                "paging": true,
                "ordering": true,
                "info": true,
                dom: 'Bfrtip', // Needs to include 'B' for buttons
                buttons: [
                    {
                        extend: 'excelHtml5',
                        text: 'Export to Excel',
                        title: 'Data Export REACT',
                        filename: 'react_data_export_topic_finished_student_' + new Date().toLocaleDateString() + '_' + new Date().toLocaleTimeString(),
                        customize: function (xlsx) {
                            var sheet = xlsx.xl.worksheets['sheet1.xml'];
                            // Customizations go here
                        }
                    },
                    'pdf',
                ]
            });
            $('#studentSubmissionTable').DataTable({
                // Configuration options
                "paging": true,
                "ordering": true,
                "info": true,
                dom: 'Bfrtip', // Needs to include 'B' for buttons
                buttons: [
                    {
                        extend: 'excelHtml5',
                        text: 'Export to Excel',
                        title: 'Data Export REACT',
                        filename: 'react_data_export_student_submission_student_' + new Date().toLocaleDateString() + '_' + new Date().toLocaleTimeString(),
                        customize: function (xlsx) {
                            var sheet = xlsx.xl.worksheets['sheet1.xml'];
                            // Customizations go here
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        text: 'Export to PDF',
                        title: 'Data Export REACT',
                        filename: 'react_data_export_student_submission_student_' + new Date().toLocaleDateString().replace(/\//g, '-') + '_' + new Date().toLocaleTimeString().replace(/:/g, '-'),
                        orientation: 'portrait', // 'portrait' or 'landscape'
                        pageSize: 'A4', // 'A3', 'A4', 'A5', 'LEGAL', 'LETTER' or 'TABLOID'
                        exportOptions: {
                            columns: ':visible' // Export visible columns only
                        },
                        customize: function (doc) {
                            doc.styles.title = {
                                color: '#4c4c4c',
                                fontSize: '20',
                                alignment: 'center'
                            }
                            doc.styles.tableHeader = {
                                fillColor: '#2d4154',
                                color: 'white',
                                alignment: 'center'
                            }
                            // Customize the PDF header, footer, etc. here
                        }
                    },
                ]
            });
            $('#finnishedProgressTable').DataTable({
                // Configuration options
                "paging": true,
                "ordering": true,
                "info": true,
                dom: 'Bfrtip', // Needs to include 'B' for buttons
                buttons: [
                    {
                        extend: 'excelHtml5',
                        text: 'Export to Excel',
                        title: 'Data Export REACT',
                        filename: 'react_data_export_progress_student_' + new Date().toLocaleDateString() + '_' + new Date().toLocaleTimeString(),
                        customize: function (xlsx) {
                            var sheet = xlsx.xl.worksheets['sheet1.xml'];
                            // Customizations go here
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        text: 'Export to PDF',
                        title: 'Data Export REACT',
                        filename: 'react_data_export_progress_student_' + new Date().toLocaleDateString().replace(/\//g, '-') + '_' + new Date().toLocaleTimeString().replace(/:/g, '-'),
                        orientation: 'portrait', // 'portrait' or 'landscape'
                        pageSize: 'A4', // 'A3', 'A4', 'A5', 'LEGAL', 'LETTER' or 'TABLOID'
                        exportOptions: {
                            columns: ':visible' // Export visible columns only
                        },
                        customize: function (doc) {
                            doc.styles.title = {
                                color: '#4c4c4c',
                                fontSize: '20',
                                alignment: 'center'
                            }
                            doc.styles.tableHeader = {
                                fillColor: '#2d4154',
                                color: 'white',
                                alignment: 'center'
                            }
                            // Customize the PDF header, footer, etc. here
                        }
                    },
                ]
            });
            $('#tableStudentReport').DataTable({
                // Configuration options
                "paging": true,
                "ordering": true,
                "info": true,
                dom: 'Bfrtip', // Needs to include 'B' for buttons
                buttons: [
                    {
                        extend: 'excelHtml5',
                        text: 'Export to Excel',
                        title: 'Data Export REACT',
                        filename: 'react_data_export_progress_student_' + new Date().toLocaleDateString() + '_' + new Date().toLocaleTimeString(),
                        customize: function (xlsx) {
                            var sheet = xlsx.xl.worksheets['sheet1.xml'];
                            // Customizations go here
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        text: 'Export to PDF',
                        title: 'Data Export REACT',
                        filename: 'react_data_export_progress_student_' + new Date().toLocaleDateString().replace(/\//g, '-') + '_' + new Date().toLocaleTimeString().replace(/:/g, '-'),
                        orientation: 'portrait', // 'portrait' or 'landscape'
                        pageSize: 'A4', // 'A3', 'A4', 'A5', 'LEGAL', 'LETTER' or 'TABLOID'
                        exportOptions: {
                            columns: ':visible' // Export visible columns only
                        },
                        customize: function (doc) {
                            doc.styles.title = {
                                color: '#4c4c4c',
                                fontSize: '20',
                                alignment: 'center'
                            }
                            doc.styles.tableHeader = {
                                fillColor: '#2d4154',
                                color: 'white',
                                alignment: 'center'
                            }
                            // Customize the PDF header, footer, etc. here
                        }
                    },
                ]
            });
        });
    </script>


    <style>
        .dropdown {
            position: relative;
            display: inline-block;
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 5px;
            overflow: hidden;
            transition: 0.3s;
            opacity: 0;
            transform: translateY(-10px);
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: 0.3s;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }

        .dropdown.active .dropdown-content {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }
    </style>
    {{-- <footer class="footer"
        style="background-color: #EAEAEA; color: #636363; text-align: center; padding: 10px 0; position: fixed; bottom: 0;  width: 100%; ">
        © 2023 Your Website. All rights reserved.
    </footer> --}}

</body>


</html>