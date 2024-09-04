cmake_minimum_required(VERSION 3.16)

project(To-Do-List VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appTo-Do-List
    main.cpp
)

qt_add_qml_module(appTo-Do-List
    URI To-Do-List
    VERSION 1.0
    QML_FILES
        Main.qml
        NewTask.qml
        TimeSelector.qml
        DateSelector.qml
        PageSettings.qml
        PageSize.qml
        PageThemes.qml
        PageHome.qml
        MainPage.qml
        TacheSection.qml
        UpdateView.js
        FiltrerTaches.js
        ListeTaches.js
    SOURCES
        GestionTaches.h GestionTaches.cpp
        Tache.h Tache.cpp
    RESOURCES
        images/arrowLeft.png
        images/Calendar_Icon.svg
        images/Clock_Icon.svg
        images/logout.svg
        images/edit.png
        images/delete.png
        images/arrow_down.png
        images/arrow_up.png
        images/task_checked.png
        images/task_unchecked.png
        images/settings.png
        RESOURCES images/addbutton.png
        RESOURCES images/background.jpg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTo-Do-List PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTo-Do-List
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTo-Do-List
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTo-Do-List
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
