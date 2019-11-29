#pragma once

#include "insightmodel_export.h"

#include <QObject>
#include <QString>

class QXmlStreamReader;
class QXmlStreamWriter;

class INSIGHTMODEL_EXPORT Structure : public QObject
{
    Q_OBJECT

public:
    explicit Structure(QObject *parent = nullptr);
    virtual ~Structure() = default;

    enum Category {
        Planar,
        Linear
    };
    virtual Category category() const = 0;
    virtual QString categoryString() const = 0;
    virtual bool isVisibleInScannedRange(double to, double from) = 0;
    virtual double depthInDrilled() = 0;
    virtual QString infoString() = 0;
    virtual QString dialogString() = 0;
    virtual QString name() const = 0;
    virtual double depthInScanned() = 0;

    static QHash<Category, QString> categoryNames();

    QString comment() const;
    void setComment(const QString &comment);

private:
    QString m_comment;
    static const QHash<Category, QString> m_structureCategoryNames;
};

Q_DECLARE_METATYPE(Structure::Category)
