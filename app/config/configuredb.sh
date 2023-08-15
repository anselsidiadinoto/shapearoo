#!/bin/bash

echo "drop database"
dropdb -U anselsidiadinoto shapearoo_demo
echo "create database"
createdb -U anselsidiadinoto shapearoo_demo
echo ""


psql -U anselsidiadinoto shapearoo_demo < ./app/config/shapearoo-demo-database.sql

echo ""
echo "database configured"
echo ""

