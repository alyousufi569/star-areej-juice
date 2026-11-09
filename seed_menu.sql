-- STAR AREEJ JUICE — قائمة بداية جاهزة
-- شغّل هذا الملف في Supabase > SQL Editor بعد أخذ نسخة احتياطية.
-- الأسعار: صغير 5، وسط 8، كبير 10 ريال.
-- السعرات تُترك NULL/فارغة عمداً حتى تدخل القيم المعتمدة من لوحة الإدارة.
-- لا يحذف هذا الملف المنتجات الموجودة؛ يتجاوز الاسم + القسم إذا كانا موجودين.

insert into public.products
  (name, category, description, image_url, prices, calories, active, sort_order)
select v.name, v.category, v.description, v.image_url,
       v.prices::jsonb, '{}'::jsonb, true, v.sort_order
from (values
  ('كوكتيل أريج','خلطات خاصة','مزيج فواكه منعش بطابع المحل','https://images.unsplash.com/photo-1546173159-315724a31696?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',10),
  ('خلطة استوائية','خلطات خاصة','مزيج استوائي بالفواكه الموسمية','https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',20),
  ('أفوكادو بالعسل','خلطات خاصة','أفوكادو كريمي مع العسل','https://images.unsplash.com/photo-1623065422902-30a2d299bbe4?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',30),
  ('مانجو بالحليب','خلطات خاصة','مانجو ممزوج بالحليب','https://images.unsplash.com/photo-1622597467836-f3285f2131b8?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',40),

  ('عصير برتقال','عصائر طازجة','عصير برتقال منعش','https://images.unsplash.com/photo-1613478223719-2ab802602423?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',50),
  ('عصير مانجو','عصائر طازجة','عصير مانجو بطعم غني','https://images.unsplash.com/photo-1553279768-865429fa0078?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',60),
  ('عصير فراولة','عصائر طازجة','عصير فراولة منعش','https://images.unsplash.com/photo-1498579397066-22750a3cb424?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',70),
  ('ليمون نعناع','عصائر طازجة','ليمون مع النعناع','https://images.unsplash.com/photo-1513558161293-cdaf765edfd4?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',80),
  ('عصير رمان','عصائر طازجة','عصير رمان بطعم مميز','https://images.unsplash.com/photo-1547514701-42782101795e?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',90),

  ('ميلك شيك شوكولاتة','ميلك شيك','ميلك شيك بنكهة الشوكولاتة','https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',100),
  ('ميلك شيك فراولة','ميلك شيك','ميلك شيك بالفراولة','https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',110),
  ('ميلك شيك فانيلا','ميلك شيك','ميلك شيك كلاسيكي بالفانيلا','https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',120),

  ('سموذي مانجو','سموذي','سموذي مانجو بارد','https://images.unsplash.com/photo-1553279768-865429fa0078?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',130),
  ('سموذي التوت','سموذي','سموذي بالتوت والفواكه','https://images.unsplash.com/photo-1490474418585-ba9bad8fd0ea?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',140),

  ('موهيتو كلاسيك','الموهيتو','ليمون ونعناع ومشروب غازي','https://images.unsplash.com/photo-1513558161293-cdaf765edfd4?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',150),
  ('موهيتو فراولة','الموهيتو','موهيتو بنكهة الفراولة','https://images.unsplash.com/photo-1499638309848-e9968540da83?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',160),
  ('موهيتو بلو','الموهيتو','موهيتو أزرق منعش','https://images.unsplash.com/photo-1513558161293-cdaf765edfd4?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',170),

  ('سلطة فواكه','سلطة الفواكه','تشكيلة فواكه طازجة مقطعة','https://images.unsplash.com/photo-1490474418585-ba9bad8fd0ea?w=900&auto=format&fit=crop&q=85','{"small":5,"medium":8,"large":10}',180)
) as v(name, category, description, image_url, prices, sort_order)
where not exists (
  select 1 from public.products p
  where p.name = v.name and p.category = v.category
);

-- تنبيه: هذه قائمة تجريبية مقترحة وليست منيو منقولاً حرفياً من متجر آخر.
-- راجع توفر كل صنف ومكوناته وصوره قبل نشره للعملاء.
