function getNombreDeTachesIncomplete(model)
{
    var count = 0;
    for (var i = 0; i < model.count; i++)
    {
        var item = model.get(i);
        if (!item.isCompleted)
        {
            count++;
        }
    }

    return count;
}
