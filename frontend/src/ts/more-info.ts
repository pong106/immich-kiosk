function initRatingStars(id: string): void {
    const container = document.getElementById(id);
    if (!container) return;

    if (container.dataset.initialised) return;
    container.dataset.initialised = "true";

    const stars = Array.from(
        container.querySelectorAll(".rating-star-container"),
    );

    container.addEventListener("mouseover", (e: MouseEvent): void => {
        container.classList.add("is-hovering");

        const star = (e.target as HTMLElement | null)?.closest<HTMLElement>(
            ".rating-star-container",
        );

        if (!star || !container.contains(star)) return;

        const index = Number(star.dataset.starIndex);

        stars.forEach((s, i): void => {
            s.classList.toggle("is-hover-filled", i <= index);
        });
    });

    container.addEventListener("mouseleave", (): void => {
        container.classList.remove("is-hovering");

        stars.forEach((s): void => {
            s.classList.remove("is-hover-filled");
        });
    });
}

export { initRatingStars };
