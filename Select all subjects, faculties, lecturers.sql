select public.lecturers.name AS "Lecturer", public.facultiets.name AS "Faculty", public.subjects.name AS "Subject"
	FROM public.subjects
    JOIN public.facultiets ON public.facultiets.id_faculty=public.subjects.id_faculty
    JOIN public.lecturers ON public.lecturers.id_lecturer=public.subjects.id_lecturer
    ORDER BY public.lecturers.name