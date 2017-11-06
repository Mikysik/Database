select DISTINCT public.lecturers.name AS "Lecturer", public.subjects.name AS "Subject"
	from public.lecturers JOIN public.subjects 
    ON public.lecturers.id_lecturer=public.subjects.id_lecturer
		where public.lecturers.name='Нетреба Андрій' 
    ORDER BY public.lecturers.name 