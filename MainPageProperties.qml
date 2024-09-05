import QtQuick 6.7

Item {
    id: style

    /**
     * @property bool isDarkMode
     * @brief Propriété qui détermine si le mode sombre est activé.
     * @default mainWindow.isDarkMode
     */
    property bool isDarkMode: mainWindow.isDarkMode

    /**
     * @property int fontSize
     * @brief Propriété pour la taille de la police.
     * @default mainWindow.sousMenufSize
     */
    property int fontSize: mainWindow.sousMenufSize + 2

    /**
     * @property color bulleColorTodayLight
     * @brief Couleur de la bulle pour Today en mode clair.
     * @default "#008000"
     */
    property color bulleColorTodayLight: "#008000"

    /**
     * @property color bulleColorTodayDark
     * @brief Couleur de la bulle pour la section Today en mode sombre.
     * @default "transparent"
     */
    property color bulleColorTodayDark: "transparent"

    /**
     * @property color bulleColorToday
     * @brief Couleur de la bulle pour la section Today, selon le mode sombre ou clair.
     */
    property color bulleColorToday: isDarkMode ? bulleColorTodayDark : bulleColorTodayLight

    /**
     * @property color bulleColorThisWeekLight
     * @brief Couleur de la bulle pour la section This Week en mode clair.
     * @default "orange"
     */
    property color bulleColorThisWeekLight: "orange"

    /**
     * @property color bulleColorThisWeekDark
     * @brief Couleur de la bulle pour la section This Week en mode sombre.
     * @default "transparent"
     */
    property color bulleColorThisWeekDark: "transparent"

    /**
     * @property color bulleColorThisWeek
     * @brief Couleur de la bulle pour la section This Week, selon le mode sombre ou clair.
     */
    property color bulleColorThisWeek: isDarkMode ? bulleColorThisWeekDark : bulleColorThisWeekLight

    /**
     * @property color bulleColorLaterLight
     * @brief Couleur de la bulle pour la section Later en mode clair.
     * @default "purple"
     */
    property color bulleColorLaterLight: "purple"

    /**
     * @property color bulleColorLaterDark
     * @brief Couleur de la bulle pour la section Later en mode sombre.
     * @default "transparent"
     */
    property color bulleColorLaterDark: "transparent"

    /**
     * @property color bulleColorLater
     * @brief Couleur de la bulle pour la section Later, selon le mode sombre ou clair.
     */
    property color bulleColorLater: isDarkMode ? bulleColorLaterDark : bulleColorLaterLight

    /**
     * @property color bulleBorderColorTodayLight
     * @brief Couleur de la bordure de la bulle pour la section Today en mode clair.
     * @default "transparent"
     */
    property color bulleBorderColorTodayLight: "transparent"

    /**
     * @property color bulleBorderColorTodayDark
     * @brief Couleur de la bordure de la bulle pour la section Today en mode sombre.
     * @default "white"
     */
    property color bulleBorderColorTodayDark: "white"

    /**
     * @property color bulleBorderColorToday
     * @brief Couleur de la bordure de la bulle pour la section Today, selon le mode sombre ou clair.
     */
    property color bulleBorderColorToday: isDarkMode ? bulleBorderColorTodayDark : bulleBorderColorTodayLight

    /**
     * @property color bulleBorderColorThisWeekLight
     * @brief Couleur de la bordure de la bulle pour la section This Week en mode clair.
     * @default "transparent"
     */
    property color bulleBorderColorThisWeekLight: "transparent"

    /**
     * @property color bulleBorderColorThisWeekDark
     * @brief Couleur de la bordure de la bulle pour la section This Week en mode sombre.
     * @default "white"
     */
    property color bulleBorderColorThisWeekDark: "white"

    /**
     * @property color bulleBorderColorThisWeek
     * @brief Couleur de la bordure de la bulle pour la section This Week, selon le mode sombre ou clair.
     */
    property color bulleBorderColorThisWeek: isDarkMode ? bulleBorderColorThisWeekDark : bulleBorderColorThisWeekLight

    /**
     * @property color bulleBorderColorLaterLight
     * @brief Couleur de la bordure de la bulle pour la section Later en mode clair.
     * @default "transparent"
     */
    property color bulleBorderColorLaterLight: "transparent"

    /**
     * @property color bulleBorderColorLaterDark
     * @brief Couleur de la bordure de la bulle pour la section Later en mode sombre.
     * @default "white"
     */
    property color bulleBorderColorLaterDark: "white"

    /**
     * @property color bulleBorderColorLater
     * @brief Couleur de la bordure de la bulle pour la section Later, selon le mode sombre ou clair.
     */
    property color bulleBorderColorLater: isDarkMode ? bulleBorderColorLaterDark : bulleBorderColorLaterLight

    /**
     * @property color backgroundColorTitleLight
     * @brief Couleur de l'arrière-plan du titre en mode clair.
     * @default "transparent"
     */
    property color backgroundColorTitleLight: "transparent"

    /**
     * @property color backgroundColorTitleDark
     * @brief Couleur de l'arrière-plan du titre en mode sombre.
     * @default "transparent"
     */
    property color backgroundColorTitleDark: "transparent"

    /**
     * @property color backgroundColorTitle
     * @brief Couleur de l'arrière-plan du titre, selon le mode sombre ou clair.
     */
    property color backgroundColorTitle: isDarkMode ? backgroundColorTitleDark : backgroundColorTitleLight

    /**
     * @property color titleSectionColorLight
     * @brief Couleur du titre de la section en mode clair.
     * @default "black"
     */
    property color titleSectionColorLight: mainWindow.sousMenuColor

    /**
     * @property color titleSectionColorDark
     * @brief Couleur du titre de la section en mode sombre.
     * @default "white"
     */
    property color titleSectionColorDark: "white"

    /**
     * @property color titleSectionColor
     * @brief Couleur du titre de la section, selon le mode sombre ou clair.
     */
    property color titleSectionColor: isDarkMode ? titleSectionColorDark : titleSectionColorLight

    /**
     * @property color borderTacheColorLight
     * @brief Couleur de la bordure des tâches en mode clair.
     * @default "lightgray"
     */
    property color borderTacheColorLight: "lightgray"

    /**
     * @property color borderTacheColorDark
     * @brief Couleur de la bordure des tâches en mode sombre.
     * @default "white"
     */
    property color borderTacheColorDark: "white"

    /**
     * @property color borderTacheColor
     * @brief Couleur de la bordure des tâches, selon le mode sombre ou clair.
     */
    property color borderTacheColor: isDarkMode ? borderTacheColorDark : borderTacheColorLight

    /**
     * @property color backgroundTacheColorLight
     * @brief Couleur de l'arrière-plan des tâches en mode clair.
     * @default "white"
     */
    property color backgroundTacheColorLight: "white"

    /**
     * @property color backgroundTacheColorDark
     * @brief Couleur de l'arrière-plan des tâches en mode sombre.
     * @default "transparent"
     */
    property color backgroundTacheColorDark: "transparent"

    /**
     * @property color backgroundTacheColor
     * @brief Couleur de l'arrière-plan des tâches, selon le mode sombre ou claire.
     */
    property color backgroundTacheColor: isDarkMode ? backgroundTacheColorDark : backgroundTacheColorLight

    /**
     * @property color titleTacheColorLight
     * @brief Couleur du titre des tâches en mode clair.
     * @default "black"
     */
    property color titleTacheColorLight: "black"

    /**
     * @property color titleTacheColorDark
     * @brief Couleur du titre des tâches en mode sombre.
     * @default "white"
     */
    property color titleTacheColorDark: "white"

    /**
     * @property color titleTacheColor
     * @brief Couleur du titre des tâches, selon le mode sombre ou clair.
     */
    property color titleTacheColor: isDarkMode ? titleTacheColorDark : titleTacheColorLight

    /**
     * @property color dateHeureColorLight
     * @brief Couleur de la date et heure en mode clair.
     * @default "green"
     */
    property color dateHeureColorLight: "green"

    /**
     * @property color dateHeureColorDark
     * @brief Couleur de la date et heure en mode sombre.
     * @default "white"
     */
    property color dateHeureColorDark: "white"

    /**
     * @property color dateHeureColor
     * @brief Couleur de la date et heure, selon le mode sombre ou clair.
     */
    property color dateHeureColor: isDarkMode ? dateHeureColorDark : dateHeureColorLight

    /**
     * @property color noteColorLight
     * @brief Couleur du texte des notes en mode clair.
     * @default "black"
     */
    property color noteColorLight: "black"

    /**
     * @property color noteColorDark
     * @brief Couleur du texte des notes en mode sombre.
     * @default "white"
     */
    property color noteColorDark: "white"

    /**
     * @property color noteColor
     * @brief Couleur du texte des notes, selon le mode sombre ou clair.
     */
    property color noteColor: isDarkMode ? noteColorDark : noteColorLight

    /**
     * @property color tacheValidatedColorLight
     * @brief Couleur de de la checkbox de validation en mode clair.
     * @default "green"
     */
    property color tacheValidatedColorLight: "green"

    /**
     * @property color tacheValidatedColorDark
     * @brief Couleur de la cjeckbox de validation en mode sombre.
     * @default "green"
     */
    property color tacheValidatedColorDark: "green"

    /**
     * @property color tacheValidatedColor
     * @brief Couleur de la checkbox de validation, selon le mode sombre ou clair.
     */
    property color tacheValidatedColor: isDarkMode ? tacheValidatedColorDark : tacheValidatedColorLight

    /**
     * @property color buttonAddTaskColorLight
     * @brief Couleur du bouton pour ajouter une tâche en mode clair.
     * @default "#008000"
     */
    property color buttonAddTaskColorLight: "#008000"

    /**
     * @property color buttonAddTaskColorDark
     * @brief Couleur du bouton pour ajouter une tâche en mode sombre.
     * @default "darkgray"
     */
    property color buttonAddTaskColorDark: "darkgray"

    /**
     * @property color buttonAddTaskColor
     * @brief Couleur du bouton pour ajouter une tâche, selon le mode sombre ou clair.
     */
    property color buttonAddTaskColor: isDarkMode ? buttonAddTaskColorDark : buttonAddTaskColorLight

    /**
     * @property color checkBoxValidatedColorLight
     * @brief Couleur de la case à cocher en mode clair.
     * @default "#008000"
     */
    property color checkBoxValidatedColorLight: "#008000"

    /**
     * @property color checkBoxValidatedColorDark
     * @brief Couleur de la case à cocher en mode sombre.
     * @default "#008000"
     */
    property color checkBoxValidatedColorDark: "#008000"

    /**
     * @property color checkBoxValidatedColor
     * @brief Couleur de la case à cocher, selon le mode sombre ou clair.
     */
    property color checkBoxValidatedColor: isDarkMode ? checkBoxValidatedColorDark : checkBoxValidatedColorLight

    /**
     * @property color checkBoxValidatedBorderColorLight
     * @brief Couleur de la bordure de la case à cocher en mode clair.
     * @default "black"
     */
    property color checkBoxValidatedBorderColorLight: "black"

    /**
     * @property color checkBoxValidatedBorderColorDark
     * @brief Couleur de la bordure de la case à cocher en mode sombre.
     * @default "white"
     */
    property color checkBoxValidatedBorderColorDark: "white"

    /**
     * @property color checkBoxValidatedBorderColor
     * @brief Couleur de la bordure de la case à cocher, selon le mode sombre ou clair.
     */
    property color checkBoxValidatedBorderColor: isDarkMode ? checkBoxValidatedBorderColorDark : checkBoxValidatedBorderColorLight

    /**
     * @property color textFieldAddTaskBackgroundColorLight
     * @brief Couleur de l'arrière-plan du champ de texte pour ajouter une tâche en mode clair.
     * @default "white"
     */
    property color textFieldAddTaskBackgroundColorLight: "white"

    /**
     * @property color textFieldAddTaskBackgroundColorDark
     * @brief Couleur de l'arrière-plan du champ de texte pour ajouter une tâche en mode sombre.
     * @default "transparent"
     */
    property color textFieldAddTaskBackgroundColorDark: "transparent"

    /**
     * @property color textFieldAddTaskBackgroundColor
     * @brief Couleur de l'arrière-plan du champ de texte pour ajouter une tâche, selon le mode sombre ou clair.
     */
    property color textFieldAddTaskBackgroundColor: isDarkMode ? textFieldAddTaskBackgroundColorDark : textFieldAddTaskBackgroundColorLight

    /**
     * @property color textFieldAddTaskBorderColorLight
     * @brief Couleur de la bordure du champ de texte pour ajouter une tâche en mode clair.
     * @default "#008000"
     */
    property color textFieldAddTaskBorderColorLight: "#008000"

    /**
     * @property color textFieldAddTaskBorderColorDark
     * @brief Couleur de la bordure du champ de texte pour ajouter une tâche en mode sombre.
     * @default "white"
     */
    property color textFieldAddTaskBorderColorDark: "white"

    /**
     * @property color textFieldAddTaskBorderColor
     * @brief Couleur de la bordure du champ de texte pour ajouter une tâche, selon le mode sombre ou clair.
     */
    property color textFieldAddTaskBorderColor: isDarkMode ? textFieldAddTaskBorderColorDark : textFieldAddTaskBorderColorLight

    /**
     * @property color textFieldAddTaskTextColorLight
     * @brief Couleur du texte du champ de texte pour ajouter une tâche en mode clair.
     * @default "#008000"
     */
    property color textFieldAddTaskTextColorLight: "#008000"

    /**
     * @property color textFieldAddTaskTextColorDark
     * @brief Couleur du texte du champ de texte pour ajouter une tâche en mode sombre.
     * @default "white"
     */
    property color textFieldAddTaskTextColorDark: "white"

    /**
     * @property color textFieldAddTaskTextColor
     * @brief Couleur du texte du champ de texte pour ajouter une tâche, selon le mode sombre ou clair.
     */
    property color textFieldAddTaskTextColor: isDarkMode ? textFieldAddTaskTextColorDark : textFieldAddTaskTextColorLight

    /**
     * @property color textFieldAddTaskPlaceHolderTextColorLight
     * @brief Couleur du texte (placeholder) du champ de texte pour ajouter une tâche en mode clair.
     * @default "darkgray"
     */
    property color textFieldAddTaskPlaceHolderTextColorLight: "darkgray"

    /**
     * @property color textFieldAddTaskPlaceHolderTextColorDark
     * @brief Couleur du texte (placeholder) du champ de texte pour ajouter une tâche en mode sombre.
     * @default "lightgray"
     */
    property color textFieldAddTaskPlaceHolderTextColorDark: "lightgray"

    /**
     * @property color textFieldAddTaskPlaceHolderTextColor
     * @brief Couleur du texte (placeholder) du champ de texte pour ajouter une tâche, selon le mode sombre ou clair.
     */
    property color textFieldAddTaskPlaceHolderTextColor: isDarkMode ? textFieldAddTaskPlaceHolderTextColorDark : textFieldAddTaskPlaceHolderTextColorLight
}
