
const openTaskContainer = document.getElementById('AddTaskButton');
const TaskContainer = document.getElementById('AddTaskContainer');
const TaskOverlay = document.getElementById('task-overlay');
const closeTaskContainer = document.getElementById('CloseTaskContainerButton');

const moreMenu = document.querySelector('.MoreMenu');

var taskStatusElements = document.querySelectorAll('#tasks #task #task-status');
var taskPriorityElements = document.querySelectorAll('#tasks #task #task-priority');

TaskContainer.style.display = 'none';
moreMenu.style.display = 'none';

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

function displayMore(){
    if (moreMenu.style.display === 'none') {
        moreMenu.style.display = 'block';
    } else {
        moreMenu.style.display = 'none';
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
        element.style.backgroundColor = '#87ceeb'; // Sky blue for "Medium"
    } else if (priority === 'high') {
        element.style.backgroundColor = '#e6635a'; // Light pink for "High"
    }
});