from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import String, Boolean, Enum, ForeignKey, Table
from sqlalchemy.orm import Mapped, mapped_column, relationship
import enum
from typing import List


db = SQLAlchemy()  # intancia de una clase

# Ejemplo de una tabla en flasksqlalchemy

# relationship one to many


class User(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    email: Mapped[str] = mapped_column(
        String(120), unique=True, nullable=False)
    password: Mapped[str] = mapped_column(String(180), nullable=False)
    password_hash: Mapped[str] = mapped_column(String(180), default=1)
    is_active: Mapped[bool] = mapped_column(Boolean, default=False)

    # manera vieja (pronto no se usara)
    # posts = relationship("Post", back_populates="author", uselist=True) # --> [user: posts]
    posts: Mapped[List["Post"]] = relationship(back_populates="author")

    def __repr__(self):
        return f"<User {self.email}>"

    def serialize(self):
        return {
            "id": self.id,
            "email": self.email,
            "is_active": self.is_active
        }


class Post(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    title: Mapped[str] = mapped_column(String(100), nullable=False)
    content: Mapped[str] = mapped_column(db.Text, nullable=False)

    user_id: Mapped[int] = mapped_column(ForeignKey("user.id"))

    # manera vieja (pronto no se usara)
    # author = relationship("User", back_populates="posts")

    author: Mapped["User"] = relationship(back_populates="posts")

# ***********************************************************************************************************
# Relationship one to one


class GenderEnum(enum.Enum):
    MALE = "Male"
    FEMALE = "Female"
    OTHER = "Other"


class Parent(db.Model):
    __tablename__ = "parents"
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), nullable=False)
    gender: Mapped[str] = mapped_column(
        Enum(GenderEnum), default="OTHER")  # (Male, Female, Other)
    address: Mapped[str] = mapped_column(
        String(200), nullable=True)

    child: Mapped["Child"] = relationship(back_populates="parent")


class Child(db.Model):
    __tablename__ = "child_table"
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), nullable=False)

    parents_id: Mapped[int] = mapped_column(
        ForeignKey("parents.id"), unique=True)

    parent: Mapped["Parent"] = relationship(back_populates="child")


# relationship many to many (remember association_table)
class Customer(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(150), nullable=False)
    email: Mapped[str] = mapped_column(
        String(150), unique=True, nullable=False)

    products: Mapped[List["Product"]] = relationship(
        secondary="customer_product", back_populates="customers")


class Product(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(100), nullable=False)
    price: Mapped[float] = mapped_column(nullable=False)
    in_stock: Mapped[bool] = mapped_column(Boolean, nullable=False)

    customers: Mapped[List["Customer"]] = relationship(
        secondary="customer_product", back_populates="products")


customer_product = Table(
    "customer_product",
    db.metadata,
    db.Column("customer_id", ForeignKey("customer.id"), primary_key=True),
    db.Column("product_id", ForeignKey("product.id"), primary_key=True)
)
