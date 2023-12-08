
const openTaskContainer = document.getElementById('AddTaskButton');
const TaskContainer = document.getElementById('AddTaskContainer');
const TaskOverlay = document.getElementById('task-overlay');
const closeTaskContainer = document.getElementById('CloseTaskContainerButton');

const moreMenu = document.querySelector('.MoreMenu');

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