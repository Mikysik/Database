select public.facultiets.name AS "Faculty", public.lecturers.name AS "Lecturers"
	from public.facultiets JOIN public.lecturers 
    ON public.facultiets.id_faculty=public.lecturers.id_faculty
		where public.facultiets.name='Філософський факультет'  