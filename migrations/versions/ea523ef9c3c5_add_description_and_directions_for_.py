"""add description and directions for recipe

Revision ID: ea523ef9c3c5
Revises: 9f84dbb96d36
Create Date: 2023-08-22 00:20:08.800545

"""
from alembic import op
import sqlalchemy as sa
import sqlmodel


# revision identifiers, used by Alembic.
revision = 'ea523ef9c3c5'
down_revision = '9f84dbb96d36'
branch_labels = None
depends_on = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('recipe', sa.Column('description', sqlmodel.sql.sqltypes.AutoString(), nullable=False))
    op.add_column('recipe', sa.Column('directions', sqlmodel.sql.sqltypes.AutoString(), nullable=False))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('recipe', 'directions')
    op.drop_column('recipe', 'description')
    # ### end Alembic commands ###
