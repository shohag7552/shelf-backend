import '../src/generated_prisma_client/client.dart';

PrismaClient getPrismaClient(request) {
  return request.context['prisma'] as PrismaClient;
}