document.addEventListener("DOMContentLoaded", () => {
    const replyLinks = document.querySelectorAll('.reply-link');

    replyLinks.forEach(link => {
        link.addEventListener('click', (event) => {
            event.preventDefault();
            const commentId = link.dataset.commentId;
            const form = document.getElementById(`reply-form-${commentId}`);

            if (form.style.display === "none" || form.style.display === "") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        });
    });
});
