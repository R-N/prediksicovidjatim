from django.urls import path, include, re_path
from django.views.static import serve
from django.conf import settings

from django.contrib import admin
from django.conf.urls.static import static

admin.autodiscover()

import web.views

# To add a new path, first import the app:
# import blog
#
# Then add the new path:
# path('blog/', blog.urls, name="blog")
#
# Learn more here: https://docs.djangoproject.com/en/2.1/topics/http/urls/

urlpatterns = [
    path("", web.views.index, name="index"),
    path("db/", web.views.db, name="db"),
    path("admin/", admin.site.urls),
    path("notebook/<path:nb_path>", web.views.notebook),
    path("model/", web.views.kabko),
    path("model/<str:kabko>", web.views.model),
    path("about/", web.views.about),
    #path("map/", web.views.map),
    re_path(r'^static/(?P<path>.*)$', serve,{'document_root': settings.STATIC_ROOT}),
]
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
