
const openTaskContainer = document.getElementById('AddTaskButton');
const TaskContainer = document.getElementById('AddTaskContainer');
const TaskOverlay = document.getElementById('task-overlay');
const closeTaskContainer = document.getElementById('CloseTaskContainerButton');
const openProjectSettings = document.getElementById('project-settings');
const projectSettingsContainer = document.getElementById('EditProjectContainer');
const projectSettingsOverlay = document.getElementById('edit-project-overlay');
const closeProjectSettingsContainer = document.getElementById('CloseEditProjectContainerButton');

const moreMenu = document.querySelector('.MoreMenu');
const projectMoreMenu = document.querySelector('.Project-MoreMenu');
const taskMoreMenu = document.querySelector('.Task-MoreMenu');

var taskStatusElements = document.querySelectorAll('#tasks #task #task-status');
var taskPriorityElements = document.querySelectorAll('#tasks #task #task-priority');

TaskContainer.style.display = 'none';
moreMenu.style.display = 'none';
projectMoreMenu.style.display = 'none';
taskMoreMenu.style.display = 'none';
EditProjectContainer.style.display = 'none';

toggleAddTaskContainer(openTaskContainer);
toggleAddTaskContainer(closeTaskContainer);

function toggleAddTaskContainer(Button){
    Button.addEventListener('click', () => {
        if (TaskContainer.style.display === 'none') {
            TaskOverlay.style.display = 'block';
            TaskContainer.style.display = 'block'; // Show the div
        } else {
            TaskOverlay.style.display = 'none';
            TaskContainer.style.display = 'none'; // Hide the div
        }
    });
}

document.getElementById("AddProjectButton").addEventListener("click", function() {
    window.location.href = "/projects";
});

document.getElementById("CloseEditTaskContainerButton").addEventListener("click", function() {
    window.history.back();
});

document.getElementById("CloseEditProjectContainerButton").addEventListener("click", function() {
    window.history.back();
});

function displayMore(){
    if (moreMenu.style.display === 'none') {
        moreMenu.style.display = 'block';
    } else {
        moreMenu.style.display = 'none';
    }
}

function displayProjectMore(){
    if (projectMoreMenu.style.display === 'none') {
        projectMoreMenu.style.display = 'block';
    } else {
        projectMoreMenu.style.display = 'none';
    }
}

function displayTaskMore(){
    if (taskMoreMenu.style.display === 'none') {
        taskMoreMenu.style.display = 'block';
    } else {
        taskMoreMenu.style.display = 'none';
    }
}

taskStatusElements.forEach(function (element) {
    var status = element.textContent.trim().toLowerCase();

    if (status === 'to do') {
        element.style.backgroundColor = '#ebb160'; // Light red for "To Do"
    } else if (status === 'in progress') {
        element.style.backgroundColor = '#6092e0'; // Light orange for "In Progress"
    } else if (status === 'done') {
        element.style.backgroundColor = '#90ee90'; // Light green for "Done"
    }
});

taskPriorityElements.forEach(function (element) {
    var priority = element.textContent.trim().toLowerCase();

    if (priority === 'low') {
        element.style.backgroundColor = '#b5b5b5'; // Light blue for "Low"
    } else if (priority === 'medium') {
        element.style.backgroundColor = '#f7ca60'; // Sky blue for "Medium"
    } else if (priority === 'high') {
        element.style.backgroundColor = '#e6635a'; // Light pink for "High"
    }
});

document.addEventListener('DOMContentLoaded', function () {
        var taskDetailPattern = /^\/projects\/\d+\/\d+\/$/;
        if (taskDetailPattern.test(window.location.pathname)) {
            document.getElementById('EditTaskContainer').style.display = 'block';
            document.getElementById('edit-task-overlay').style.display = 'block';

            var taskForm = document.getElementById('editTaskForm');
            var projectID = taskForm.getAttribute('data-project-id');
            var taskID = taskForm.getAttribute('data-task-id');
            taskForm.action = `/projects/${projectID}/${taskID}/`;
        }
});

document.addEventListener('DOMContentLoaded', function() {
        var currentUrl = window.location.href;
        if (currentUrl.includes('/settings/')) {
            projectSettingsContainer.style.display = 'block';
            projectSettingsOverlay.style.display = 'block';
            projectMoreMenu.style.display = 'block';
        }
});
