<!-- This file will serve as the Controller for the Application
 according to the MVC architecture we are implementing -->
<!-- It's the center processing unit for the application -->
<?php
// Ensure there are absolutely no spaces or blank lines before this opening PHP tag!

/* importing what we need from the models file */
require('model/database.php');
require('model/assignments_db.php');
require('model/course_db.php');

/* Listing the data the Controller will Receive */
$assignment_id = filter_input(INPUT_POST, 'assignment_id', FILTER_VALIDATE_INT);
$description = htmlspecialchars($_POST['description'] ?? '', ENT_QUOTES, 'UTF-8');
$course_name = htmlspecialchars($_POST['course_name'] ?? '', ENT_QUOTES, 'UTF-8');
$update_name = htmlspecialchars($_POST['update'] ?? '', ENT_QUOTES, 'UTF-8');

$course_id = filter_input(INPUT_POST, 'course_id', FILTER_VALIDATE_INT);
if (!$course_id) {
    $course_id = filter_input(INPUT_GET, 'course_id', FILTER_VALIDATE_INT);
}

// The Route
$action = htmlspecialchars($_POST['action'] ?? '', ENT_QUOTES, 'UTF-8');
if (!$action) {
    $action = htmlspecialchars($_GET['action'] ?? '', ENT_QUOTES, 'UTF-8');
    if (!$action) {
        $action = 'list_assignments';
    }
}

// The Handling of the Routing
switch ($action) {
    case "list_courses":
        $courses = get_courses();
        include('view/course_list.php');
        break;

    case "add_course":
        $safe_course_name = (string)$course_name;
        if (!empty($safe_course_name)) {
            add_course($safe_course_name);
            $message = "Congratulations! You have successfully added the course: " . $safe_course_name;
            include('view/error.php');
        } else {
            $error = "Invalid course data. Please enter a valid course name.";
            include('view/error.php');
        }
        break;

    case "add_assignment":
        if ($course_id && $description) {
            add_assignment($course_id, $description);
            // FIX: Replaced header redirect with a success message
            $message = "You have successfully added the new assignment.";
            include('view/error.php');
        } else {
            $error = "Invalid assignment data. Check all fields and try again.";
            include('view/error.php');
        }
        break;

    case "delete_course":
        if ($course_id) {
            try {
                delete_course($course_id);
                // FIX: Replaced header redirect with a success message
                $message = "You have successfully deleted the course.";
                include('view/error.php');
            } catch (PDOException $e) {
                $error = "You cannot delete a course if assignments exist in the course.";
                include('view/error.php');
            }
        }
        break;

    case "delete_assignment":
        if ($assignment_id) {
            delete_assignment($assignment_id);
            $message = "You have successfully deleted your assignment.";
            include('view/error.php');
        } else {
            $error = "Missing or Incorrect assignment Id.";
            include('view/error.php');
        }
        break;

    case "update_course":
        if ($course_id && !empty($update_name)) {
            try {
                update_course($course_id, $update_name);
                $message = "You have successfully updated your course!";
                include('view/error.php');
            } catch (PDOException $e) {
                $error = "Something went wrong editing this course.";
                include('view/error.php');
            }
        }
        break;

    default:
        $course_name = get_course_name($course_id);
        $courses = get_courses();
        $assignments = get_assignment_by_course($course_id);
        include('view/assignments_list.php');
        break;
}
?>