select public.facultiets.name AS "Faculty", public.subjects.name AS "Subject"
	from public.facultiets JOIN public.subjects 
    ON public.facultiets.id_faculty=public.subjects.id_faculty
		where public.facultiets.name='Філософський факультет' 
    ORDER BY public.facultiets.name
    