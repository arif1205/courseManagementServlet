// Get the modal
var modal = document.getElementById("showStudentModal");

// Get the button that opens the modal
var courseLists = [...document.querySelectorAll("#courseList li")];

courseLists.forEach((v) => {
	v.addEventListener("click", () => {
		modal.style.display = "block";
	});
});

// Get the <span> element that closes the modal
let span = document.getElementsByClassName("close-showStudentModal")[0];
console.log(span);

// When the user clicks on <span> (x), close the modal
span.onclick = () => {
	modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
};
