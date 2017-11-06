select DISTINCT public.lecturers.name AS "Lecturer", public.facultiets.name AS "Faculty"
	FROM public.subjects
    JOIN public.facultiets ON public.facultiets.id_faculty=public.subjects.id_faculty
    JOIN public.lecturers ON public.lecturers.id_lecturer=public.subjects.id_lecturer
    WHERE public.facultiets.name='Факультет психології' 