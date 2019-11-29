#pragma once

#include <QObject>

class Structure : public QObject
{
    Q_OBJECT

public:
    explicit Structure(QObject *parent = nullptr);
};

