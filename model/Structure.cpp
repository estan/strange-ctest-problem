#include "Structure.h"

#include <QHash>
#include <QString>
#include <QXmlStreamReader>
#include <QXmlStreamWriter>

Structure::Structure(QObject *parent)
    : QObject(parent)
{
}

QHash<Structure::Category, QString> Structure::categoryNames()
{
    return m_structureCategoryNames;
}

QString Structure::comment() const
{
    return m_comment;
}

void Structure::setComment(const QString &comment)
{
    m_comment = comment;
}
const QHash<Structure::Category, QString> Structure::m_structureCategoryNames = {
    { Structure::Planar, "Planar" },
    { Structure::Linear, "Linear" }
};
