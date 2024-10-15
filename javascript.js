let students = [];

// Function to add student details
function addStudent() {
    const name = document.getElementById("name").value;
    const age = document.getElementById("age").value;
    const grade = document.getElementById("grade").value;

    if (name && age && grade) {
        students.push({ name, age, grade: parseInt(grade) });
        alert("Student added successfully!");
        clearInputs();
    } else {
        alert("Please fill all fields!");
    }
}

// Function to view students
function viewStudents() {
    const studentListDiv = document.getElementById("studentList");
    studentListDiv.innerHTML = ''; // Clear previous output

    if (students.length === 0) {
        studentListDiv.innerHTML = "<p>No students added yet!</p>";
    } else {
        let table = "<table><tr><th>Name</th><th>Age</th><th>Grade</th></tr>";
        students.forEach(student => {
            table += `<tr>
                         <td>${student.name}</td>
                         <td>${student.age}</td>
                         <td>${student.grade}</td>
                      </tr>`;
        });
        table += "</table>";
        studentListDiv.innerHTML = table;

        // Add mouseover and mouseout event listeners
        const rows = studentListDiv.getElementsByTagName('tr');
        for (let i = 1; i < rows.length; i++) { // Start at 1 to skip header
            rows[i].addEventListener('mouseover', function() {
                this.style.backgroundColor = '#f0f0f0'; // Highlight on mouseover
            });
            rows[i].addEventListener('mouseout', function() {
                this.style.backgroundColor = ''; // Remove highlight on mouseout
            });
        }
    }
}

// Function to sort students by grade in descending order
function sortStudentsByGrade() {
    students.sort((a, b) => b.grade - a.grade);
    viewStudents();  // Display sorted list
}

// Function to delete a student by name
function deleteStudent() {
    const nameToDelete = prompt("Enter the name of the student you want to delete:");
    if (nameToDelete) {
        const studentIndex = students.findIndex(student => student.name.toLowerCase() === nameToDelete.toLowerCase());
        
        if (studentIndex !== -1) {
            const confirmation = confirm(`Are you sure you want to delete ${students[studentIndex].name}?`);
            if (confirmation) {
                students.splice(studentIndex, 1);
                alert("Student deleted successfully.");
                viewStudents();  // Refresh the list
            }
        } else {
            alert("Student not found!");
        }
    }
}

// Helper function to clear input fields
function clearInputs() {
    document.getElementById("name").value = '';
    document.getElementById("age").value = '';
    document.getElementById("grade").value = '';
}
