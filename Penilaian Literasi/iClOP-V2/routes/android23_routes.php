<?php 

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Android\AndroidController;
use App\Http\Controllers\Android\AndroidMaterialController;
use App\Http\Controllers\Android\SubmissionController;
use App\Http\Controllers\Android\EnrollController;


// Route::get('/login', function() {
// 	return view('auth.login');
// });
// Route::post('proses-login', [AuthController::class, 'proses']);


Route::middleware('auth')->group(function () {
	
	// Admin
	Route::get('android23/topic', [AndroidController::class, 'index']);
	Route::post('android23/topic/add', [AndroidController::class, 'add']);
	Route::post('android23/topic/update/{id}', [AndroidController::class, 'update']);
	Route::get('android23/topic/delete/{id}', [AndroidController::class, 'delete']);
	Route::get('android23/topic/learning/{id}', [AndroidController::class, 'learning_view']);
	Route::post('android23/topic/learning/add/{id}/{tipe}', [AndroidController::class, 'learning_add']);
	Route::post('android23/topic/learning/update/{id}/{id_task}', [AndroidController::class, 'learning_update']);
	Route::get('android23/topic/learning/delete/{id}/{id_task}', [AndroidController::class, 'learning_remove']);

	// update data testcase
	Route::post('android23/topic/update-testcase', [AndroidController::class, 'learning_update_testcase']);
	Route::get('android23/topic/reset/{id_topic}/{id_task}', [AndroidController::class, 'learning_reset_testcase']);
	Route::get('android23/topic/remove-testcase/{id_topic}/{id_testcase}', [AndroidController::class, 'learning_remove_testcase']);
	Route::post('android23/topic/add-testcase/{id_topic}/{id_task}', [AndroidController::class, 'learning_add_testcase']);
});


Route::group(['middleware'	=> ['auth', 'teacher']], function() {

	// Android 23
	Route::get('teacher/android23/material', [AndroidController::class, 'lecturer_material']);
  	Route::get('teacher/android23/overview/{id}', [AndroidController::class, 'lecturer_overview']);
  	Route::get('teacher/android23/waiting', [AndroidController::class, 'lecturer_waiting']);
  	Route::get('teacher/android23/waiting/preview/{id}', [AndroidController::class, 'lecturer_waiting_preview']);
  
  	Route::get('teacher/android23/onvalidate/{id}/{submit_id}', [AndroidController::class, 'lecturer_do_validate']);
  	Route::get('teacher/android23/load-point/{submit_id}', [AndroidController::class, 'lecturer_load_point_testcase']);


  	Route::get('teacher/android23/overview-student/{topic_id}/{user_id}', [AndroidController::class, 'lecturer_overview_student']);
  	Route::get('teacher/android23/overview-student-confirm/{topic_id}/{user_id}/{enroll_id}', [AndroidController::class, 'lecturer_confirm_student']);


  	Route::get('notif', [AndroidController::class, 'notify_validator']);
});



Route::group(['middleware' => ['auth', 'student']], function() {


	/** Android 23 */
	Route::get("/android23/material", [AndroidMaterialController::class, 'index'])->name('material');
	Route::get("/android23/task/{id}", [AndroidMaterialController::class, 'task'])->name('task');
	Route::get("/android23/task/submission/{id}", [AndroidMaterialController::class, 'submission'])->name('submit-submission');
	  

	Route::post("android23/material/enroll/{id}", [EnrollController::class, 'enroll']);

	Route::post('file-upload', [AndroidMaterialController::class, 'upload'])->name('file.upload');

	// submit task
	Route::post("/send-submission", [SubmissionController::class, 'proses_tambah'])->name('submission');
	Route::post("/send-final-submission/{id}", [SubmissionController::class, 'submit_final_submission'])->name('final-submission');
	Route::get('/android23/overview/{id}', [SubmissionController::class, 'overview'])->name('overview');

	// validation res
	Route::get('/android23/validation', [AndroidMaterialController::class, 'validation']);
	Route::get('/android23/detail/{id}', [AndroidMaterialController::class, 'validation_detail']);
});



Route::get("/logout", function() {})->name('logout');
