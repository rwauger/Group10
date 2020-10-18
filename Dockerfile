FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /api

COPY . ./
RUN dotnet publish . -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /api
COPY --from=build-env /api/out .
RUN echo | ls .
# Build runtime image
ENTRYPOINT ["dotnet", "Group10.API.dll"]